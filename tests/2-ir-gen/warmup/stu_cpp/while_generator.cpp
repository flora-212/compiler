#include "BasicBlock.hpp"
#include "Constant.hpp"
#include "Function.hpp"
#include "IRBuilder.hpp"
#include "Module.hpp"
#include "Type.hpp"

#include <iostream>
#include <memory>

// 定义一个从常数值获取/创建 ConstantInt 类实例化的宏，方便多次调用
#define CONST_INT(num) ConstantInt::get(num, module)

// 定义一个从常数值获取/创建 ConstantFP 类实例化的宏，方便多次调用
#define CONST_FP(num) ConstantFP::get(num, module)

int main() {
    // 创建一个 Module 实例
    auto module = new Module();
    // 创建一个 IRBuilder 实例（后续创建指令均使用此实例操作）
    auto builder = new IRBuilder(nullptr, module);
    // 从 Module 处取出 32 位整形 type 的实例
    Type *Int32Type = module->get_int32_type();
    // 接下来创建 main 函数
    auto mainFun =
        Function::create(FunctionType::get(Int32Type, {}), "main", module);
    // 创建 main 函数的起始 bb
    auto bb = BasicBlock::create(module, "entry", mainFun);
    // 将 builder 插入指令的位置调整至 main 函数起始 bb 上
    builder->set_insert_point(bb);
    // a
    auto aAlloca = builder->create_alloca(Int32Type);
    builder->create_store(CONST_INT(10), aAlloca);
    // i
    auto iAlloca = builder->create_alloca(Int32Type);
    builder->create_store(CONST_INT(0), iAlloca);
    // store and load 10
    auto tenAlloca = builder->create_alloca(Int32Type);
    builder->create_store(CONST_INT(10), tenAlloca);
    auto tenLoad = builder->create_load(tenAlloca);
    // 条件判断分支
    auto judgeBB = BasicBlock::create(module, "judgeBB", mainFun);
    // 循环分支
    auto iterBB = BasicBlock::create(module, "iterBB", mainFun);
    // 返回分支
    auto retBB = BasicBlock::create(module, "retBB", mainFun);
    // 跳转到judgeBB
    builder->create_br(judgeBB);
    // 写判断条件
    builder->set_insert_point(judgeBB);
    // i < 10
    auto iLoad = builder->create_load(iAlloca);
    auto icmp = builder->create_icmp_lt(iLoad, tenLoad);
    // 判断是否进入循环
    builder->create_cond_br(icmp, iterBB, retBB);
    // 将 builder 插入指令的位置调整至 iterBB 上
    builder->set_insert_point(iterBB);
    // i = i + 1
    auto newi = builder->create_iadd(iLoad, CONST_INT(1));
    builder->create_store(newi, iAlloca);
    // a = a + 1
    auto aLoad = builder->create_load(aAlloca);
    auto newa = builder->create_iadd(aLoad, newi);
    builder->create_store(newa, aAlloca);
    // 强制跳转回判断BB
    builder->create_br(judgeBB);
    // 将 builder 插入指令的位置调整至 retBB 上
    builder->set_insert_point(retBB);
    // return a
    auto ret = builder->create_load(aAlloca);
    builder->create_ret(ret);
    // 输出 module 中的所有 IR 指令
    std::cout << module->print();
    delete module;
    return 0;
}
