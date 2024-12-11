	.text
	.globl factorial
	.type factorial, @function
factorial:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.w $a0, $fp, -20
.factorial_label_entry:
# %op1 = icmp eq i32 %arg0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t3, $zero, $t2
	xori $t2, $t3, 1
	st.b $t2, $fp, -21
# br i1 %op1, label %label2, label %label3
	ld.b $a0, $fp, -21
	bnez $a0, .factorial_label2
	b .factorial_label3
.factorial_label2:
# ret i32 1
	addi.w $a0, $zero, 1
	b factorial_exit
.factorial_label3:
# %op4 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -25
# %op5 = call i32 @factorial(i32 %op4)
	ld.w $a0, $fp, -25
	bl factorial
	st.w $a0, $fp, -29
# %op6 = mul i32 %arg0, %op5
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -29
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -33
# ret i32 %op6
	ld.w $a0, $fp, -33
	b factorial_exit
factorial_exit:
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
	addi.d $sp, $sp, -32
.main_label_entry:
# %op0 = call i32 @factorial(i32 10)
	addi.w $a0, $zero, 10
	bl factorial
	st.w $a0, $fp, -20
# ret i32 %op0
	ld.w $a0, $fp, -20
	b main_exit
main_exit:
	addi.d $sp, $sp, 32
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
