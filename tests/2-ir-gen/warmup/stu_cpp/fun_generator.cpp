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
    // 接下来创建 callee 函数
    std::vector<Type *> Ints(1, Int32Type);
    // 创建函数类型，FunctionType::get
    // 的第一个参数是函数返回值类型，第二个是函数参数类型列表
    auto calleeFunTy = FunctionType::get(Int32Type, Ints);
    // 通过函数类型创建函数 callee，输入参数解释：函数类型，函数名 name，函数所属
    // module
    auto calleeFun = Function::create(calleeFunTy, "callee", module);
    // 为函数 callee 创建起始 BasicBlock，参数解释：所属 module，名称
    // name，所属函数
    auto bb = BasicBlock::create(module, "entry", calleeFun);
    // 将辅助类实例化 builder 插入指令的起始位置设置在 bb 对应的 BasicBlock
    builder->set_insert_point(bb);
    // alloca a
    auto aAlloca = builder->create_alloca(Int32Type);
    // 获取 gcd 函数的形参，通过 Function 中的 iterator
    std::vector<Value *> args;
    for (auto &arg : calleeFun->get_args()) {
        args.push_back(&arg);
    }
    // store a
    builder->create_store(args[0], aAlloca);
    // load a
    auto aLoad = builder->create_load(aAlloca);
    // 2 * a
    auto mul = builder->create_imul(aLoad, CONST_INT(2));
    // return
    builder->create_ret(mul);
    // 接下来创建 main 函数
    auto mainFun =
        Function::create(FunctionType::get(Int32Type, {}), "main", module);
    // 创建 main 函数的起始 bb
    bb = BasicBlock::create(module, "entry", mainFun);
    // 将 builder 插入指令的位置调整至 main 函数起始 bb 上
    builder->set_insert_point(bb);
    // callee(110)
    auto call = builder->create_call(calleeFun, {CONST_INT(110)});
    // main 函数的返回值返回
    builder->create_ret(call);
    // 输出 module 中的所有 IR 指令
    std::cout << module->print();
    delete module;
    return 0;
}