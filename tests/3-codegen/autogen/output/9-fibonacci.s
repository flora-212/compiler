	.text
	.globl fibonacci
	.type fibonacci, @function
fibonacci:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
	st.w $a0, $fp, -20
.fibonacci_label_entry:
# %op1 = alloca i32
	addi.d $t0, $fp, -28
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -28
# store i32 %arg0, i32* %op1
	ld.d $t0, $fp, -28
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op2 = load i32, i32* %op1
	ld.d $t0, $fp, -28
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -36
# %op3 = icmp eq i32 %op2, 0
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t3, $zero, $t2
	xori $t2, $t3, 1
	st.b $t2, $fp, -37
# br i1 %op3, label %label4, label %label5
	ld.b $a0, $fp, -37
	bnez $a0, .fibonacci_label4
	b .fibonacci_label5
.fibonacci_label4:
# ret i32 0
	addi.w $a0, $zero, 0
	b fibonacci_exit
.fibonacci_label5:
# %op6 = load i32, i32* %op1
	ld.d $t0, $fp, -28
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -41
# %op7 = icmp eq i32 %op6, 1
	ld.w $t0, $fp, -41
	addi.w $t1, $zero, 1
	xor $t2, $t0, $t1
	sltu $t3, $zero, $t2
	xori $t2, $t3, 1
	st.b $t2, $fp, -42
# br i1 %op7, label %label9, label %label10
	ld.b $a0, $fp, -42
	bnez $a0, .fibonacci_label9
	b .fibonacci_label10
.fibonacci_label8:
# ret i32 0
	addi.w $a0, $zero, 0
	b fibonacci_exit
.fibonacci_label9:
# ret i32 1
	addi.w $a0, $zero, 1
	b fibonacci_exit
.fibonacci_label10:
# %op11 = load i32, i32* %op1
	ld.d $t0, $fp, -28
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -46
# %op12 = sub i32 %op11, 2
	ld.w $t0, $fp, -46
	addi.w $t1, $zero, 2
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -50
# %op13 = call i32 @fibonacci(i32 %op12)
	ld.w $a0, $fp, -50
	bl fibonacci
	st.w $a0, $fp, -54
# %op14 = load i32, i32* %op1
	ld.d $t0, $fp, -28
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -58
# %op15 = sub i32 %op14, 1
	ld.w $t0, $fp, -58
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -62
# %op16 = call i32 @fibonacci(i32 %op15)
	ld.w $a0, $fp, -62
	bl fibonacci
	st.w $a0, $fp, -66
# %op17 = add i32 %op16, %op13
	ld.w $t0, $fp, -66
	ld.w $t1, $fp, -54
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -70
# ret i32 %op17
	ld.w $a0, $fp, -70
	b fibonacci_exit
.fibonacci_label18:
# br label %label8
	b .fibonacci_label8
fibonacci_exit:
	addi.d $sp, $sp, 80
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
	ld.w $a0, $fp, -20
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -24
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -36
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -36
# store i32 10, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# store i32 0, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label2
	b .main_label2
.main_label2:
# %op3 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -44
# %op4 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -48
# %op5 = icmp slt i32 %op3, %op4
	ld.w $t0, $fp, -44
	ld.w $t1, $fp, -48
	slt $t2, $t0, $t1
	st.b $t2, $fp, -49
# %op6 = zext i1 %op5 to i32
	ld.b $t0, $fp, -49
	st.w $t0, $fp, -53
# %op7 = icmp ne i32 %op6, 0
	ld.w $t0, $fp, -53
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -54
# br i1 %op7, label %label8, label %label13
	ld.b $a0, $fp, -54
	bnez $a0, .main_label8
	b .main_label13
.main_label8:
# %op9 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -58
# %op10 = call i32 @fibonacci(i32 %op9)
	ld.w $a0, $fp, -58
	bl fibonacci
	st.w $a0, $fp, -62
# call void @output(i32 %op10)
	ld.w $a0, $fp, -62
	bl output
# %op11 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -66
# %op12 = add i32 %op11, 1
	ld.w $t0, $fp, -66
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -70
# store i32 %op12, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -70
	st.w $t1, $t0, 0
# br label %label2
	b .main_label2
.main_label13:
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
main_exit:
	addi.d $sp, $sp, 80
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
