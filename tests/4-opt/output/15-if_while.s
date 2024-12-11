	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -64
.main_label_entry:
# br label %label0
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -20
	addi.w $a0, $zero, 10
	st.w $a0, $fp, -24
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -28
	b .main_label0
.main_label0:
# %op1 = phi i32 [ 0, %label_entry ], [ %op15, %label14 ]
# %op2 = phi i32 [ 10, %label_entry ], [ %op6, %label14 ]
# %op3 = phi i32 [ 0, %label_entry ], [ %op16, %label14 ]
# %op4 = icmp ne i32 %op2, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -29
# br i1 %op4, label %label5, label %label8
	ld.b $a0, $fp, -29
	bnez $a0, .main_label5
	b .main_label8
.main_label5:
# %op6 = sub i32 %op2, 1
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -33
# %op7 = icmp slt i32 %op6, 5
	ld.w $t0, $fp, -33
	addi.w $t1, $zero, 5
	slt $t2, $t0, $t1
	st.b $t2, $fp, -34
# br i1 %op7, label %label10, label %label12
	ld.b $a0, $fp, -34
	bnez $a0, .main_label10
	b .main_label12
.main_label8:
# %op9 = add i32 %op1, %op3
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -28
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -38
# ret i32 %op9
	ld.w $a0, $fp, -38
	b main_exit
.main_label10:
# %op11 = add i32 %op1, %op6
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -33
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -42
# br label %label14
	ld.w $a0, $fp, -42
	st.w $a0, $fp, -50
	ld.w $a0, $fp, -28
	st.w $a0, $fp, -54
	b .main_label14
.main_label12:
# %op13 = add i32 %op3, %op6
	ld.w $t0, $fp, -28
	ld.w $t1, $fp, -33
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -46
# br label %label14
	ld.w $a0, $fp, -20
	st.w $a0, $fp, -50
	ld.w $a0, $fp, -46
	st.w $a0, $fp, -54
	b .main_label14
.main_label14:
# %op15 = phi i32 [ %op11, %label10 ], [ %op1, %label12 ]
# %op16 = phi i32 [ %op3, %label10 ], [ %op13, %label12 ]
# br label %label0
	ld.w $a0, $fp, -50
	st.w $a0, $fp, -20
	ld.w $a0, $fp, -33
	st.w $a0, $fp, -24
	ld.w $a0, $fp, -54
	st.w $a0, $fp, -28
	b .main_label0
main_exit:
	addi.d $sp, $sp, 64
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
