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
    // float 的实例
    Type *FloatType = module->get_float_type();
    // 接下来创建 main 函数
    auto mainFun =
        Function::create(FunctionType::get(Int32Type, {}), "main", module);
    // 创建 main 函数的起始 bb
    auto bb = BasicBlock::create(module, "entry", mainFun);
    // 将 builder 插入指令的位置调整至 main 函数起始 bb 上
    builder->set_insert_point(bb);
    // 使用辅助类实例化 builder 创建了一条 alloca 指令，在栈上分配返回值的空间
    auto retAlloca = builder->create_alloca(Int32Type);
    // a = 5.555
    auto aAlloca = builder->create_alloca(FloatType);
    builder->create_store(CONST_FP(5.555), aAlloca);
    auto aLoad = builder->create_load(aAlloca);
    // 比较
    auto fcmp = builder->create_fcmp_gt(aLoad, CONST_FP(1.0));
    // 创建 BasicBlock 作为 true 分支
    auto trueBB = BasicBlock::create(module, "trueBB", mainFun);
    // 创建 BasicBlock 作为 false 分支
    auto falseBB = BasicBlock::create(module, "falseBB", mainFun);
    // return 分支
    auto retBB = BasicBlock::create(module, "", mainFun); 
    // 使用 fcmp指令的返回值作为条件，trueBB 与 falseBB 作为条件跳转的两个目的 basicblock
    builder->create_cond_br(fcmp, trueBB, falseBB);
    // 将辅助类实例化 builder 插入指令的位置调整至 trueBB 上
    builder->set_insert_point(trueBB);
    // store 233
    builder->create_store(CONST_INT(233), retAlloca);
    // 创建强制跳转指令，跳转至 retBB
    builder->create_br(retBB); // br retBB
    // 将辅助类实例化 builder 插入指令的位置调整至 falseBB 上
    builder->set_insert_point(falseBB);
    // store 0
    builder->create_store(CONST_INT(0), retAlloca);
    // 创建强制跳转指令，跳转至 retBB
    builder->create_br(retBB); // br retBB
    // 将 builder 插入指令的位置调整至 retBB 上
    builder->set_insert_point(retBB); // ret 分支
    // return
    auto retLoad = builder->create_load(retAlloca);
    builder->create_ret(retLoad);
    // 输出 module 中的所有 IR 指令
    std::cout << module->print();
    delete module;
    return 0;
}