	.text
	.globl fibonacci
	.type fibonacci, @function
fibonacci:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.w $a0, $fp, -20
.fibonacci_label_entry:
# %op1 = icmp eq i32 %arg0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t3, $zero, $t2
	xori $t2, $t3, 1
	st.b $t2, $fp, -21
# br i1 %op1, label %label2, label %label3
	ld.b $a0, $fp, -21
	bnez $a0, .fibonacci_label2
	b .fibonacci_label3
.fibonacci_label2:
# ret i32 0
	addi.w $a0, $zero, 0
	b fibonacci_exit
.fibonacci_label3:
# %op4 = icmp eq i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	xor $t2, $t0, $t1
	sltu $t3, $zero, $t2
	xori $t2, $t3, 1
	st.b $t2, $fp, -22
# br i1 %op4, label %label5, label %label6
	ld.b $a0, $fp, -22
	bnez $a0, .fibonacci_label5
	b .fibonacci_label6
.fibonacci_label5:
# ret i32 1
	addi.w $a0, $zero, 1
	b fibonacci_exit
.fibonacci_label6:
# %op7 = sub i32 %arg0, 2
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 2
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -26
# %op8 = call i32 @fibonacci(i32 %op7)
	ld.w $a0, $fp, -26
	bl fibonacci
	st.w $a0, $fp, -30
# %op9 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -34
# %op10 = call i32 @fibonacci(i32 %op9)
	ld.w $a0, $fp, -34
	bl fibonacci
	st.w $a0, $fp, -38
# %op11 = add i32 %op10, %op8
	ld.w $t0, $fp, -38
	ld.w $t1, $fp, -30
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -42
# ret i32 %op11
	ld.w $a0, $fp, -42
	b fibonacci_exit
fibonacci_exit:
	addi.d $sp, $sp, 48
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
	addi.d $sp, $sp, -48
.main_label_entry:
# br label %label0
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -20
	b .main_label0
.main_label0:
# %op1 = phi i32 [ 0, %label_entry ], [ %op7, %label5 ]
# %op2 = icmp slt i32 %op1, 10
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	st.b $t2, $fp, -21
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -21
	st.w $t0, $fp, -25
# %op4 = icmp ne i32 %op3, 0
	ld.w $t0, $fp, -25
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -26
# br i1 %op4, label %label5, label %label8
	ld.b $a0, $fp, -26
	bnez $a0, .main_label5
	b .main_label8
.main_label5:
# %op6 = call i32 @fibonacci(i32 %op1)
	ld.w $a0, $fp, -20
	bl fibonacci
	st.w $a0, $fp, -30
# call void @output(i32 %op6)
	ld.w $a0, $fp, -30
	bl output
# %op7 = add i32 %op1, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -34
# br label %label0
	ld.w $a0, $fp, -34
	st.w $a0, $fp, -20
	b .main_label0
.main_label8:
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
main_exit:
	addi.d $sp, $sp, 48
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
