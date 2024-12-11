# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl seed
	.type seed, @object
	.size seed, 4
seed:
	.space 4
	.text
	.globl randomLCG
	.type randomLCG, @function
randomLCG:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.randomLCG_label_entry:
# %op0 = load i32, i32* @seed
	la.local $t0, seed
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -20
# %op1 = mul i32 %op0, 1103515245
	ld.w $t0, $fp, -20
	lu12i.w $t1, 269412
	ori $t1, $t1, 3693
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -24
# %op2 = add i32 %op1, 12345
	ld.w $t0, $fp, -24
	lu12i.w $t1, 3
	ori $t1, $t1, 57
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -28
# store i32 %op2, i32* @seed
	la.local $t0, seed
	ld.w $t1, $fp, -28
	st.w $t1, $t0, 0
# %op3 = load i32, i32* @seed
	la.local $t0, seed
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -32
# ret i32 %op3
	ld.w $a0, $fp, -32
	b randomLCG_exit
randomLCG_exit:
	addi.d $sp, $sp, 32
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
	.globl randBin
	.type randBin, @function
randBin:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.randBin_label_entry:
# %op0 = call i32 @randomLCG()
	bl randomLCG
	st.w $a0, $fp, -20
# %op1 = icmp sgt i32 %op0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	st.b $t2, $fp, -21
# br i1 %op1, label %label2, label %label3
	ld.b $a0, $fp, -21
	bnez $a0, .randBin_label2
	b .randBin_label3
.randBin_label2:
# ret i32 1
	addi.w $a0, $zero, 1
	b randBin_exit
.randBin_label3:
# ret i32 0
	addi.w $a0, $zero, 0
	b randBin_exit
randBin_exit:
	addi.d $sp, $sp, 32
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
	.globl returnToZeroSteps
	.type returnToZeroSteps, @function
returnToZeroSteps:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -64
.returnToZeroSteps_label_entry:
# br label %label0
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -20
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -24
	b .returnToZeroSteps_label0
.returnToZeroSteps_label0:
# %op1 = phi i32 [ 0, %label_entry ], [ %op16, %label20 ]
# %op2 = phi i32 [ 0, %label_entry ], [ %op15, %label20 ]
# %op3 = icmp slt i32 %op1, 20
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 20
	slt $t2, $t0, $t1
	st.b $t2, $fp, -25
# %op4 = zext i1 %op3 to i32
	ld.b $t0, $fp, -25
	st.w $t0, $fp, -29
# %op5 = icmp ne i32 %op4, 0
	ld.w $t0, $fp, -29
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -30
# br i1 %op5, label %label6, label %label9
	ld.b $a0, $fp, -30
	bnez $a0, .returnToZeroSteps_label6
	b .returnToZeroSteps_label9
.returnToZeroSteps_label6:
# %op7 = call i32 @randBin()
	bl randBin
	st.w $a0, $fp, -34
# %op8 = icmp ne i32 %op7, 0
	ld.w $t0, $fp, -34
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -35
# br i1 %op8, label %label10, label %label12
	ld.b $a0, $fp, -35
	bnez $a0, .returnToZeroSteps_label10
	b .returnToZeroSteps_label12
.returnToZeroSteps_label9:
# ret i32 20
	addi.w $a0, $zero, 20
	b returnToZeroSteps_exit
.returnToZeroSteps_label10:
# %op11 = add i32 %op2, 1
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -39
# br label %label14
	ld.w $a0, $fp, -39
	st.w $a0, $fp, -47
	b .returnToZeroSteps_label14
.returnToZeroSteps_label12:
# %op13 = sub i32 %op2, 1
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -43
# br label %label14
	ld.w $a0, $fp, -43
	st.w $a0, $fp, -47
	b .returnToZeroSteps_label14
.returnToZeroSteps_label14:
# %op15 = phi i32 [ %op11, %label10 ], [ %op13, %label12 ]
# %op16 = add i32 %op1, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -51
# %op17 = icmp eq i32 %op15, 0
	ld.w $t0, $fp, -47
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t3, $zero, $t2
	xori $t2, $t3, 1
	st.b $t2, $fp, -52
# br i1 %op17, label %label18, label %label19
	ld.b $a0, $fp, -52
	bnez $a0, .returnToZeroSteps_label18
	b .returnToZeroSteps_label19
.returnToZeroSteps_label18:
# ret i32 %op16
	ld.w $a0, $fp, -51
	b returnToZeroSteps_exit
.returnToZeroSteps_label19:
# br label %label20
	b .returnToZeroSteps_label20
.returnToZeroSteps_label20:
# br label %label0
	ld.w $a0, $fp, -51
	st.w $a0, $fp, -20
	ld.w $a0, $fp, -47
	st.w $a0, $fp, -24
	b .returnToZeroSteps_label0
returnToZeroSteps_exit:
	addi.d $sp, $sp, 64
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
.main_label_entry:
# store i32 3407, i32* @seed
	la.local $t0, seed
	lu12i.w $t1, 0
	ori $t1, $t1, 3407
	st.w $t1, $t0, 0
# br label %label0
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -20
	b .main_label0
.main_label0:
# %op1 = phi i32 [ 0, %label_entry ], [ %op7, %label5 ]
# %op2 = icmp slt i32 %op1, 20
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 20
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
# %op6 = call i32 @returnToZeroSteps()
	bl returnToZeroSteps
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
