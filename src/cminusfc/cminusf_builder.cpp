#include "cminusf_builder.hpp"
#include "logging.hpp"

#define CONST_FP(num) ConstantFP::get((float)num, module.get())
#define CONST_INT(num) ConstantInt::get(num, module.get())

// types
Type *VOID_T;
Type *INT1_T;
Type *INT32_T;
Type *INT32PTR_T;
Type *FLOAT_T;
Type *FLOATPTR_T;

/*
 * use CMinusfBuilder::Scope to construct scopes
 * scope.enter: enter a new scope
 * scope.exit: exit current scope
 * scope.push: add a new binding to current scope
 * scope.find: find and return the value bound to the name
 */

Value* CminusfBuilder::visit(ASTProgram &node) {
    VOID_T = module->get_void_type();
    INT1_T = module->get_int1_type();
    INT32_T = module->get_int32_type();
    INT32PTR_T = module->get_int32_ptr_type();
    FLOAT_T = module->get_float_type();
    FLOATPTR_T = module->get_float_ptr_type();

    Value *ret_val = nullptr;
    for (auto &decl : node.declarations) {
        ret_val = decl->accept(*this);
    }
    return ret_val;
}

Value* CminusfBuilder::visit(ASTNum &node) {
    // TODO: This function is empty now.
    // Add some code here.
    Value *val = nullptr;
    if(node.type == TYPE_INT){
        val = CONST_INT(node.i_val);
    }
    else if(node.type == TYPE_FLOAT){
        val = CONST_FP(node.f_val);
    }
    LOG(INFO) << val->print();
    return val;
}

Value* CminusfBuilder::visit(ASTVarDeclaration &node) {
    // TODO: This function is empty now.
    // Add some code here.
    Type *type_specifier = nullptr;
    if(node.type == TYPE_INT){
        type_specifier = INT32_T;
    }
    else if(node.type == TYPE_FLOAT){
        type_specifier = FLOAT_T;
    }
    auto *zero = ConstantZero::get(type_specifier, module.get());
    Value *val = nullptr;
    if(node.num == nullptr){
        if(scope.in_global()){
            val = GlobalVariable::create(node.id, module.get(), type_specifier, false, zero);
        }
        else{
            val = builder->create_alloca(type_specifier);
        }
    }
    else{
        auto size = dynamic_cast<ASTNum*>(node.num.get())->i_val;
        Type *array_type = ArrayType::get(type_specifier, size);
        if(scope.in_global()){
            val = GlobalVariable::create(node.id, module.get(), array_type, false, zero);
        }
        else{
            val = builder->create_alloca(array_type);
        }
    }
    scope.push(node.id, val);
    return val;
}

Value* CminusfBuilder::visit(ASTFunDeclaration &node) {
    LOG(INFO) << "start fun declaration";
    FunctionType *fun_type;
    Type *ret_type;
    std::vector<Type *> param_types;
    if (node.type == TYPE_INT)
        ret_type = INT32_T;
    else if (node.type == TYPE_FLOAT)
        ret_type = FLOAT_T;
    else
        ret_type = VOID_T;
    for (auto &param : node.params) {
        // TODO: Please accomplish param_types.
        if (param->isarray == 1){
            if(param->type == TYPE_INT){
                param_types.push_back(INT32PTR_T);
            }else if(param->type == TYPE_FLOAT){
                param_types.push_back(FLOATPTR_T);
            }
        }
        else{
            if(param->type == TYPE_INT){
                param_types.push_back(INT32_T);
            }else if(param->type == TYPE_FLOAT){
                param_types.push_back(FLOAT_T);
            }
        }
    }

    fun_type = FunctionType::get(ret_type, param_types);
    auto func = Function::create(fun_type, node.id, module.get());
    scope.push(node.id, func);
    context.func = func;
    auto funBB = BasicBlock::create(module.get(), "entry", func);
    builder->set_insert_point(funBB);
    scope.enter();
    std::vector<Value *> args;
    for (auto &arg : func->get_args()) {
        args.push_back(&arg);
    }
    for (unsigned int i = 0; i < node.params.size(); ++i) {
        // TODO: You need to deal with params and store them in the scope.
        auto param = node.params[i];
        Value *val = nullptr;
        if(param->isarray){
            if(param_types[i]->get_pointer_element_type()->is_integer_type()){
                val = builder->create_alloca(INT32PTR_T);
            } else if(param_types[i]->get_pointer_element_type()->is_float_type()){
                val = builder->create_alloca(FLOATPTR_T);
            }
            Value *n = nullptr;
            builder->create_store(args[i], val);
            n = builder->create_load(val);
            scope.push(param->id, n);
        }
        else{
            if(param_types[i]->is_integer_type()){
                val = builder->create_alloca(INT32_T);
            } else if(param_types[i]->is_float_type()){
                val = builder->create_alloca(FLOAT_T);
            }
            builder->create_store(args[i], val);
            scope.push(param->id, val);
        }
    }
    node.compound_stmt->accept(*this);
    if (not builder->get_insert_block()->is_terminated()) {
        if (context.func->get_return_type()->is_void_type())
            builder->create_void_ret();
        else if (context.func->get_return_type()->is_float_type())
            builder->create_ret(CONST_FP(0.));
        else
            builder->create_ret(CONST_INT(0));
    }
    scope.exit();
    return nullptr;
}

Value* CminusfBuilder::visit(ASTParam &node) {
    // TODO: This function is empty now.
    // Add some code here.
    return nullptr;
}

Value* CminusfBuilder::visit(ASTCompoundStmt &node) {
    // TODO: This function is not complete.
    // You may need to add some code here
    // to deal with complex statements. 
    scope.enter();
    for (auto &decl : node.local_declarations) {
        decl->accept(*this);
    }

    for (auto &stmt : node.statement_list) {
        stmt->accept(*this);
        if (builder->get_insert_block()->is_terminated())
            break;
    }
    scope.exit();
    return nullptr;
}

Value* CminusfBuilder::visit(ASTExpressionStmt &node) {
    // TODO: This function is empty now.
    // Add some code here.
    if(node.expression != nullptr)
        node.expression->accept(*this);
    return nullptr;
}

Value* CminusfBuilder::visit(ASTSelectionStmt &node) {
    // TODO: This function is empty now.
    // Add some code here.
    Value *cond;
    cond = node.expression->accept(*this);
    if(cond->get_type()->is_int32_type()){
        cond = builder->create_icmp_ne(cond, CONST_INT(0));
    } else if(cond->get_type()->is_float_type()){
        cond = builder->create_fcmp_ne(cond, CONST_FP(0.0));
    }
    BasicBlock *ifbb, *elsebb, *retbb;
    ifbb = BasicBlock::create(module.get(), "", builder->get_insert_block()->get_parent());
    elsebb = BasicBlock::create(module.get(), "", builder->get_insert_block()->get_parent());
    retbb = BasicBlock::create(module.get(), "", builder->get_insert_block()->get_parent());
    builder->create_cond_br(cond, ifbb, elsebb);
    builder->set_insert_point(ifbb);
    node.if_statement->accept(*this);
    if(!builder->get_insert_block()->is_terminated()){
        builder->create_br(retbb);
    }
    builder->set_insert_point(elsebb);
    if(node.else_statement != nullptr){
        node.else_statement->accept(*this);
    }
    if(!builder->get_insert_block()->is_terminated()){
        builder->create_br(retbb);
    }
    builder->set_insert_point(retbb);
    return nullptr;
}

Value* CminusfBuilder::visit(ASTIterationStmt &node) {
    // TODO: This function is empty now.
    // Add some code here.
    BasicBlock *condbb, *iterbb, *retbb;
    condbb = BasicBlock::create(module.get(), "", builder->get_insert_block()->get_parent());
    iterbb = BasicBlock::create(module.get(), "", builder->get_insert_block()->get_parent());
    retbb = BasicBlock::create(module.get(), "", builder->get_insert_block()->get_parent());
    builder->create_br(condbb);
    builder->set_insert_point(condbb);
    Value *exp;
    exp = node.expression->accept(*this);
    if(exp->get_type()->is_integer_type()){
        if(exp->get_type()->is_int1_type()){
            exp = builder->create_zext(exp, INT32_T);
        }
        exp = builder->create_icmp_ne(exp, CONST_INT(0));
    } else if(exp->get_type()->is_float_type()){
        exp = builder->create_fcmp_ne(exp, CONST_FP(0.0));
    }
    builder->create_cond_br(exp, iterbb, retbb);
    builder->set_insert_point(iterbb);
    node.statement->accept(*this);
    LOG(INFO) << condbb->print();
    if(not builder->get_insert_block()->is_terminated()){
        LOG(INFO) << condbb->print();
        builder->create_br(condbb);
    }
    builder->set_insert_point(retbb);
    return nullptr;
}

Value* CminusfBuilder::visit(ASTReturnStmt &node) {
    if (node.expression == nullptr) {
        builder->create_void_ret();
        return nullptr;
    } else {
        // TODO: The given code is incomplete.
        // You need to solve other return cases (e.g. return an integer).
        Value *exp = node.expression->accept(*this);
        Type *exp_type = exp->get_type();
        Type *fun_type = nullptr;
        fun_type = context.func->get_return_type();
        LOG(INFO) << "fun_type";
        LOG(INFO) << fun_type->print();
        LOG(INFO) << "exp_type";
        LOG(INFO) << exp_type->print();
        if (fun_type->is_void_type()){
            builder->create_void_ret();
        } else {
            if(fun_type != exp_type){
                if(exp_type->is_float_type()){
                    exp = builder->create_fptosi(exp, INT32_T);
                    LOG(INFO) << exp->print();
                } else if(exp_type->is_integer_type()){
                    exp = builder->create_sitofp(exp, FLOAT_T);
                }
            }
            builder->create_ret(exp);
        }
        return nullptr;
    }
}

Value* CminusfBuilder::visit(ASTVar &node) {
    // TODO: This function is empty now.
    // Add some code here.
    Value *varloc = nullptr, *val = nullptr;
    varloc = scope.find(node.id);
    if(varloc == nullptr){
        throw std::runtime_error("Undefined variable: " + node.id);
    }
    if(node.expression != nullptr){
        LOG(INFO) << "ASTVar";
        Value *exp;
        Value *negidx = nullptr;
        bool t = context.left;
        context.left = false;
        exp = node.expression->accept(*this);
        context.left = t;
        if(exp->get_type()->is_float_type()){
            exp = builder->create_fptosi(exp, INT32_T);
        } else if(exp->get_type()->is_int1_type()){
            exp = builder->create_zext(exp, INT32_T);
        }
        negidx = builder->create_icmp_lt(exp, CONST_INT(0));
        BasicBlock *negbb, *nonnegbb;
        negbb = BasicBlock::create(module.get(), "", builder->get_insert_block()->get_parent());
        nonnegbb = BasicBlock::create(module.get(), "", builder->get_insert_block()->get_parent());
        builder->create_cond_br(negidx, negbb, nonnegbb);
        builder->set_insert_point(negbb);
        auto except=scope.find("neg_idx_except");
        builder->create_call(except, {});
        builder->create_br(nonnegbb);
        builder->set_insert_point(nonnegbb);
        if(varloc->get_type()->get_pointer_element_type()->is_array_type()){
            varloc = builder->create_gep(varloc, {CONST_INT(0), exp});
        }
        else{
            varloc = builder->create_gep(varloc, {exp});
        }
        if(context.left == true){
            return varloc;
        }
        else{
            val = builder->create_load(varloc);
            return val;
        }
    }
    else {
        if(varloc->get_type()->get_pointer_element_type()->is_array_type()){
            varloc = builder->create_gep(varloc, {CONST_INT(0), CONST_INT(0)});
            return varloc;
        }
        else{
            if(context.left == true){
                return varloc;
            }
            else{
                val = builder->create_load(varloc);
                return val;
            }
        }
    }
}

Value* CminusfBuilder::visit(ASTAssignExpression &node) {
    // TODO: This function is empty now.
    // Add some code here.
    Value *var, *expr;
    context.left = true;
    var = node.var->accept(*this);
    context.left = false;
    expr = node.expression->accept(*this);
    if(var->get_type()->get_pointer_element_type() != expr->get_type()){
        if(var->get_type()->get_pointer_element_type()->is_int32_type()){
            if(expr->get_type()->is_int1_type()){
                expr = builder->create_zext(expr, INT32_T);
            } else if(expr->get_type()->is_float_type()){
                expr = builder->create_fptosi(expr, INT32_T);
            }
        } else if(var->get_type()->get_pointer_element_type()->is_float_type()){
            if(expr->get_type()->is_integer_type()){
                expr = builder->create_sitofp(expr, FLOAT_T);
            } 
        } else if(var->get_type()->get_pointer_element_type()->is_int1_type()){
            if(expr->get_type()->is_int32_type()){
                expr = builder->create_icmp_ne(expr, CONST_INT(0));
            } else if(expr->get_type()->is_float_type()){
                expr = builder->create_fcmp_ne(expr, CONST_FP(0.0));
            }
        }
    }
    builder->create_store(expr, var);
    return expr;
}

Value* CminusfBuilder::visit(ASTSimpleExpression &node) {
    // TODO: This function is empty now.
    // Add some code here.
    Value *exp1;
    exp1 = node.additive_expression_l->accept(*this);
    if(node.additive_expression_r == nullptr){
        return exp1;
    }
    Value *exp2, *val = nullptr;
    exp2 = node.additive_expression_r->accept(*this);
    if(exp1->get_type()->is_integer_type() && exp2->get_type()->is_integer_type()){
        if(exp1->get_type()->is_int1_type()){
            exp1 = builder->create_zext(exp1, INT32_T);
        }
        if(exp2->get_type()->is_int1_type()){
            exp2 = builder->create_zext(exp2, INT32_T);
        }
        if(node.op == RelOp::OP_LE){
            val = builder->create_icmp_le(exp1, exp2);
        } else if(node.op == RelOp::OP_LT){
            val = builder->create_icmp_lt(exp1, exp2);
        } else if(node.op == RelOp::OP_GT){
            val = builder->create_icmp_gt(exp1, exp2);
        } else if(node.op == RelOp::OP_GE){
            val = builder->create_icmp_ge(exp1, exp2);
        } else if(node.op == RelOp::OP_EQ){
            val = builder->create_icmp_eq(exp1, exp2);
        } else if(node.op == RelOp::OP_NEQ){
            val = builder->create_icmp_ne(exp1, exp2);
        }
    }
    else{
        if(exp1->get_type()->is_integer_type()){
            exp1 = builder->create_sitofp(exp1, FLOAT_T);
        }
        if(exp2->get_type()->is_integer_type()){
            exp2 = builder->create_sitofp(exp2, FLOAT_T);
        }
        if(node.op == RelOp::OP_LE){
            val = builder->create_fcmp_le(exp1, exp2);
        } else if(node.op == RelOp::OP_LT){
            val = builder->create_fcmp_lt(exp1, exp2);
        } else if(node.op == RelOp::OP_GT){
            val = builder->create_fcmp_gt(exp1, exp2);
        } else if(node.op == RelOp::OP_GE){
            val = builder->create_fcmp_ge(exp1, exp2);
        } else if(node.op == RelOp::OP_EQ){
            val = builder->create_fcmp_eq(exp1, exp2);
        } else if(node.op == RelOp::OP_NEQ){
            val = builder->create_fcmp_ne(exp1, exp2);
        }
    }
    return val;
}

Value* CminusfBuilder::visit(ASTAdditiveExpression &node) {
    // TODO: This function is empty now.
    // Add some code here.
    Value *term;
    term = node.term->accept(*this);
    Value *exp;
    if(node.additive_expression == nullptr){
        return term;
    }
    exp = node.additive_expression->accept(*this);
    Value *val = nullptr;
    if(exp->get_type()->is_integer_type() && term->get_type()->is_integer_type()){
        if(node.op == AddOp::OP_PLUS){
            val = builder->create_iadd(exp, term);
        } else if(node.op == AddOp::OP_MINUS){
            val = builder->create_isub(exp, term);
        }
    }
    else{
        if(term->get_type()->is_integer_type()){
            term = builder->create_sitofp(term, FLOAT_T);
        }
        if(exp->get_type()->is_integer_type()){
            exp = builder->create_sitofp(exp, FLOAT_T);
        }
        if(node.op == AddOp::OP_PLUS){
            val = builder->create_fadd(exp, term);
        } else if(node.op == AddOp::OP_MINUS){
            val = builder->create_fsub(exp, term);
        }
    }
    return val;
}

Value* CminusfBuilder::visit(ASTTerm &node) {
    // TODO: This function is empty now.
    // Add some code here.
    Value *factor;
    factor = node.factor->accept(*this);
    Value *term;
    if(node.term == nullptr){
        return factor;
    }
    term = node.term->accept(*this);
    Value *val = nullptr;
    if(term->get_type()->is_integer_type() && factor->get_type()->is_integer_type()){
        if(node.op == MulOp::OP_MUL){
            val = builder->create_imul(term, factor);
        } else if(node.op == MulOp::OP_DIV){
            val = builder->create_isdiv(term, factor);
        }
    }
    else{
        if(term->get_type()->is_integer_type()){
            term = builder->create_sitofp(term, FLOAT_T);
        }
        if(factor->get_type()->is_integer_type()){
            factor = builder->create_sitofp(factor, FLOAT_T);
        }
        if(node.op == MulOp::OP_MUL){
            val = builder->create_fmul(term, factor);
        } else if(node.op == MulOp::OP_DIV){
            val = builder->create_fdiv(term, factor);
        }
    }
    return val;
}

Value* CminusfBuilder::visit(ASTCall &node) {
    // TODO: This function is empty now.
    auto *f = dynamic_cast<Function*>(scope.find(node.id));
    if (f == nullptr) {
        throw std::runtime_error("Function not found: " + node.id);
    }
    if (f->get_num_of_args() != node.args.size()) {
        throw std::runtime_error("Function call argument size mismatch for function: " + node.id);
    }
    std::vector<Value *> args_values;
    std::vector<Type *> args_types;
    for (auto &arg : f->get_args()) {
        args_types.push_back(arg.get_type()); 
    }
    Value *arg_value = nullptr;
    Type *arg_type = nullptr;
    int i = 0;
    for (auto &arg : node.args) {
        LOG(INFO) << "ASTCall";
        arg_type = args_types[i];
        if(arg_type->is_pointer_type()){
            context.left = true;
        }
        arg_value = arg->accept(*this);
        context.left = false;
        if(arg_type != arg_value->get_type()){
            if(arg_type->is_float_type()){
                arg_value = builder->create_sitofp(arg_value, FLOAT_T);
            } else if(arg_type->is_integer_type()){
                if(arg_value->get_type()->is_float_type()){
                    arg_value = builder->create_fptosi(arg_value, INT32_T);
                } else if(arg_value->get_type()->is_int1_type()){
                    arg_value = builder->create_zext(arg_value, INT32_T);
                }
            }
        }
        LOG(INFO) << arg_value->get_type()->print();
        LOG(INFO) << arg_type->print();
        args_values.push_back(arg_value);
        i++;
    }
    Value *val;
    val = builder->create_call(f, args_values);
    return val;
}
