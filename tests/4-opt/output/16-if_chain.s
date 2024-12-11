	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.main_label_entry:
# %op0 = icmp ne i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -17
# br i1 %op0, label %label1, label %label3
	ld.b $a0, $fp, -17
	bnez $a0, .main_label1
	b .main_label3
.main_label1:
# %op2 = icmp ne i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -18
# br i1 %op2, label %label6, label %label7
	ld.b $a0, $fp, -18
	bnez $a0, .main_label6
	b .main_label7
.main_label3:
# br label %label4
	addi.w $a0, $zero, 2
	st.w $a0, $fp, -22
	b .main_label4
.main_label4:
# %op5 = phi i32 [ %op9, %label8 ], [ 2, %label3 ]
# ret i32 %op5
	ld.w $a0, $fp, -22
	b main_exit
.main_label6:
# br label %label8
	addi.w $a0, $zero, 4
	st.w $a0, $fp, -26
	b .main_label8
.main_label7:
# br label %label8
	addi.w $a0, $zero, 3
	st.w $a0, $fp, -26
	b .main_label8
.main_label8:
# %op9 = phi i32 [ 4, %label6 ], [ 3, %label7 ]
# br label %label4
	ld.w $a0, $fp, -26
	st.w $a0, $fp, -22
	b .main_label4
main_exit:
	addi.d $sp, $sp, 32
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
