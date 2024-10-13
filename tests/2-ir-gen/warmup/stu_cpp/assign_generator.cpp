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
    // 使用取出的 32 位整形与数组长度 1，创建数组类型 [1 x i32]
    auto *arrayType = ArrayType::get(Int32Type, 10);
    // 接下来创建 main 函数
    auto mainFun =
        Function::create(FunctionType::get(Int32Type, {}), "main", module);
    // 创建 main 函数的起始 bb
    auto bb = BasicBlock::create(module, "entry", mainFun);
    // 将 builder 插入指令的位置调整至 main 函数起始 bb 上
    builder->set_insert_point(bb);
    // alloca a[10]
    auto apAlloca = builder->create_alloca(arrayType);
    // a[0] 地址
    auto a0GEP = builder->create_gep(apAlloca, {CONST_INT(0), CONST_INT(0)});
    // store a[0] = 10
    builder->create_store(CONST_INT(10), a0GEP);
    // a[1] 地址
    auto a1GEP = builder->create_gep(apAlloca, {CONST_INT(0), CONST_INT(1)});
    // 2 * a[0]
    auto a0Load = builder->create_load(a0GEP);
    auto mul = builder->create_imul(a0Load, CONST_INT(2));
    // a[1] = 2 * a[0]
    builder->create_store(mul, a1GEP);
    // 返回值
    auto ret = builder->create_load(a1GEP);
    // main 函数return
    builder->create_ret(ret);
    // 输出 module 中的所有 IR 指令
    std::cout << module->print();
    delete module;
    return 0;
}