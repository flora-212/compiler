	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -96
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t0, $fp, -24
	addi.d $t1, $t0,-40
	st.d $t1, $fp, -24
# %op1 = icmp slt i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -65
# br i1 %op1, label %label2, label %label3
	ld.b $a0, $fp, -65
	bnez $a0, .main_label2
	b .main_label3
.main_label2:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label3
	b .main_label3
.main_label3:
# %op4 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 3
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 3
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -73
# store i32 1234, i32* %op4
	ld.d $t0, $fp, -73
	addi.w $t1, $zero, 1234
	st.w $t1, $t0, 0
# %op5 = icmp slt i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -74
# br i1 %op5, label %label6, label %label7
	ld.b $a0, $fp, -74
	bnez $a0, .main_label6
	b .main_label7
.main_label6:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label7
	b .main_label7
.main_label7:
# %op8 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 3
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 3
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -82
# %op9 = load i32, i32* %op8
	ld.d $t0, $fp, -82
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -86
# ret i32 %op9
	ld.w $a0, $fp, -86
	b main_exit
main_exit:
	addi.d $sp, $sp, 96
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
