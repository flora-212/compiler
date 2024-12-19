#include "BasicBlock.hpp"
#include "Constant.hpp"
#include "Function.hpp"
#include "GlobalVariable.hpp"
#include "Instruction.hpp"
#include "LICM.hpp"
#include "PassManager.hpp"
#include <cstddef>
#include <memory>
#include <vector>

/**
 * @brief 循环不变式外提Pass的主入口函数
 * 
 */
void LoopInvariantCodeMotion::run() {

    loop_detection_ = std::make_unique<LoopDetection>(m_);
    loop_detection_->run();
    func_info_ = std::make_unique<FuncInfo>(m_);
    func_info_->run();
    for (auto &loop : loop_detection_->get_loops()) {
        is_loop_done_[loop] = false;
    }

    for (auto &loop : loop_detection_->get_loops()) {
        traverse_loop(loop);
    }
}

/**
 * @brief 遍历循环及其子循环
 * @param loop 当前要处理的循环
 * 
 */
void LoopInvariantCodeMotion::traverse_loop(std::shared_ptr<Loop> loop) {
    if (is_loop_done_[loop]) {
        return;
    }
    is_loop_done_[loop] = true;
    for (auto &sub_loop : loop->get_sub_loops()) {
        traverse_loop(sub_loop);
    }
    run_on_loop(loop);
}

// TODO: 实现collect_loop_info函数
// 1. 遍历当前循环及其子循环的所有指令
// 2. 收集所有指令到loop_instructions中
// 3. 检查store指令是否修改了全局变量，如果是则添加到updated_global中
// 4. 检查是否包含非纯函数调用，如果有则设置contains_impure_call为true
void LoopInvariantCodeMotion::collect_loop_info(
    std::shared_ptr<Loop> loop,
    std::set<Value *> &loop_instructions,
    std::set<Value *> &updated_global,
    bool &contains_impure_call) {
    
    // throw std::runtime_error("Lab4: 你有一个TODO需要完成！");
    for (auto &bb : loop->get_blocks()){
        for (auto &inst : bb->get_instructions()){
            loop_instructions.insert(&inst);
            if (auto *store_inst = dynamic_cast<StoreInst*>(&inst)){
                if(auto *global_var = dynamic_cast<GlobalVariable*>(store_inst->get_lval())){
                    updated_global.insert(&inst);
                }
            }
            if (auto *call_inst = dynamic_cast<CallInst*>(&inst)){
                if (!func_info_->is_pure_function(dynamic_cast<Function*>(call_inst->get_operand(0)))){
                    contains_impure_call = true;
                }
            }
        }
    }
    for (auto &sub_loop : loop->get_sub_loops()) {
        collect_loop_info(sub_loop, loop_instructions, updated_global, contains_impure_call);
    }
}



/**
 * @brief 对单个循环执行不变式外提优化
 * @param loop 要优化的循环
 * 
 */
void LoopInvariantCodeMotion::run_on_loop(std::shared_ptr<Loop> loop) {
    std::set<Value *> loop_instructions;
    std::set<Value *> updated_global;
    bool contains_impure_call = false;
    collect_loop_info(loop, loop_instructions, updated_global, contains_impure_call);

    std::vector<Value *> loop_invariant;


    // TODO: 识别循环不变式指令
    //
    // - 如果指令已被标记为不变式则跳过
    // - 跳过 store、ret、br、phi 等指令与非纯函数调用
    // - 特殊处理全局变量的 load 指令
    // - 检查指令的所有操作数是否都是循环不变的
    // - 如果有新的不变式被添加则注意更新 changed 标志，继续迭代

    bool changed;
    do {
        changed = false;

        // throw std::runtime_error("Lab4: 你有一个TODO需要完成！");
        for (auto *value : loop_instructions){
            auto *inst = dynamic_cast<Instruction*>(value);
            if(inst->is_store() || inst->is_ret() || inst->is_br() || inst->is_phi() || contains_impure_call){
                continue;
            }
            if (std::find(loop_invariant.begin(), loop_invariant.end(), inst) != loop_invariant.end()){
                continue;
            }
            if (auto *load_inst = dynamic_cast<LoadInst*>(inst)){
                if (auto global_var = dynamic_cast<GlobalVariable *>(load_inst->get_operand(0))) {
                    bool global_updated = false;
                    for (auto &up_instr : updated_global) { 
                        auto store_inst = dynamic_cast<StoreInst*> (static_cast<Value*>(up_instr));
                        if(store_inst->get_lval() == global_var){
                            global_updated = true;
                            break;
                        }
                    }
                    if(global_updated){
                        continue;
                    }
                }
            }
            bool is_invariant = true;
            for (auto *operand : inst->get_operands()){
                if (loop_instructions.count(operand)) {
                    if (std::find(loop_invariant.begin(), loop_invariant.end(), operand) == loop_invariant.end()){
                        is_invariant = false;
                        break;
                    }
                }
            }
            if (is_invariant) {
                loop_invariant.push_back(inst);
                changed = true;
            }
        }

    } while (changed);

    if (loop->get_preheader() == nullptr) {
        loop->set_preheader(
            BasicBlock::create(m_, "", loop->get_header()->get_parent()));
    }

    if (loop_invariant.empty())
        return;

    // insert preheader
    auto preheader = loop->get_preheader();

     // TODO: 更新 phi 指令
    auto latch_bb = loop->get_latches();
    for (auto &phi_inst_ : loop->get_header()->get_instructions()) {
        if (phi_inst_.get_instr_type() != Instruction::phi) break;
        
        auto phi_inst = dynamic_cast<PhiInst*>(&phi_inst_);
        auto old_pairs = phi_inst->get_phi_pairs();
        phi_inst->remove_all_operands();
        
        for (auto &phi_pair : old_pairs) {
            Value *val_ = phi_pair.first;
            BasicBlock *bb_ = phi_pair.second;
            
            if (latch_bb.count(bb_) > 0) {
                // 保留 latch 边原始的信息
                phi_inst->add_phi_pair_operand(val_, bb_);
            } else {
                phi_inst->add_phi_pair_operand(val_, preheader);
            }
        }
    }

    // TODO: 用跳转指令重构控制流图
    // 将所有非 latch 的 header 前驱块的跳转指向 preheader
    // 并将 preheader 的跳转指向 header
    // 注意这里需要更新前驱块的后继和后继的前驱
    std::vector<BasicBlock *> pred_to_remove;
    auto all_bbs = loop->get_blocks();
    auto header = loop->get_header();
    
    for (auto &pred : loop->get_header()->get_pre_basic_blocks()) {
        if ((latch_bb.count(pred) <= 0) && (std::find(all_bbs.begin(), all_bbs.end(), pred) == all_bbs.end())) {
            // 将所有非 latch 的 header 前驱块的跳转指向 preheader
            pred_to_remove.push_back(pred);
            auto term = pred->get_terminator();
            if (term) {
                assert(term->is_br());
                auto br = dynamic_cast<BranchInst*>(term);
                for (int i = 0; i < br->get_num_operand(); i++) {
                    auto op = br->get_operand(i);
                    if (op == header) {
                        br->set_operand(i, preheader);
                    }
                }
            }
        }
    }

    for (auto &pred : pred_to_remove) {
        header->remove_pre_basic_block(pred);
        preheader->add_pre_basic_block(pred);
        pred->remove_succ_basic_block(loop->get_header());
        pred->add_succ_basic_block(preheader);
    }

    if (preheader->is_terminated()) {
        preheader->erase_instr(preheader->get_terminator());
    }

    // header->add_pre_basic_block(preheader); // 重复
    // preheader->add_succ_basic_block(loop->get_header());

    // TODO: 外提循环不变指令
    for (auto inv_inst1 = loop_invariant.rbegin(); inv_inst1 != loop_invariant.rend(); ++inv_inst1) {
        std::cout << "Value pointer: " << *inv_inst1 << std::endl;

        if (auto inv_inst = dynamic_cast<Instruction*>(*inv_inst1)) {
            std::cout << "success" << std::endl;
        } else {
            std::cout << "fail" << std::endl;
        }

        auto inv_inst = dynamic_cast<Instruction*>(*inv_inst1);
        if (!inv_inst) continue;

        // 从原位置移除
        auto old_bb = inv_inst->get_parent();
        old_bb->remove_instr(inv_inst);

        // 插入到 preheader 终结指令前
        preheader->add_instr_begin(inv_inst);
    }

    std::cout << "Number of instructions in preheader: " << preheader->get_instructions().size() << std::endl;
    
    for (auto &bb : loop->get_blocks()) {
        std::cout << "Number of instructions in bb in loop: " << bb->get_instructions().size() << std::endl;
    }



    // insert preheader br to header
    BranchInst::create_br(loop->get_header(), preheader);

    // insert preheader to parent loop
    if (loop->get_parent() != nullptr) {
        loop->get_parent()->add_block(preheader);
    }
}