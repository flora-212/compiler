	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -96
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -24
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -36
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -36
# %op2 = alloca i32
	addi.d $t0, $fp, -48
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -48
# store i32 11, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 11
	st.w $t1, $t0, 0
# store i32 22, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 22
	st.w $t1, $t0, 0
# store i32 33, i32* %op2
	ld.d $t0, $fp, -48
	addi.w $t1, $zero, 33
	st.w $t1, $t0, 0
# %op3 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -56
# %op4 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -60
# %op5 = icmp sgt i32 %op3, %op4
	ld.w $t0, $fp, -56
	ld.w $t1, $fp, -60
	slt $t2, $t1, $t0
	st.b $t2, $fp, -61
# br i1 %op5, label %label6, label %label10
	ld.b $a0, $fp, -61
	bnez $a0, .main_label6
	b .main_label10
.main_label6:
# %op7 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -65
# %op8 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -69
# %op9 = icmp sgt i32 %op7, %op8
	ld.w $t0, $fp, -65
	ld.w $t1, $fp, -69
	slt $t2, $t1, $t0
	st.b $t2, $fp, -70
# br i1 %op9, label %label15, label %label17
	ld.b $a0, $fp, -70
	bnez $a0, .main_label15
	b .main_label17
.main_label10:
# %op11 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -74
# %op12 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -78
# %op13 = icmp slt i32 %op11, %op12
	ld.w $t0, $fp, -74
	ld.w $t1, $fp, -78
	slt $t2, $t0, $t1
	st.b $t2, $fp, -79
# br i1 %op13, label %label20, label %label22
	ld.b $a0, $fp, -79
	bnez $a0, .main_label20
	b .main_label22
.main_label14:
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
.main_label15:
# %op16 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -83
# call void @output(i32 %op16)
	ld.w $a0, $fp, -83
	bl output
# br label %label19
	b .main_label19
.main_label17:
# %op18 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -87
# call void @output(i32 %op18)
	ld.w $a0, $fp, -87
	bl output
# br label %label19
	b .main_label19
.main_label19:
# br label %label14
	b .main_label14
.main_label20:
# %op21 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -91
# call void @output(i32 %op21)
	ld.w $a0, $fp, -91
	bl output
# br label %label24
	b .main_label24
.main_label22:
# %op23 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -95
# call void @output(i32 %op23)
	ld.w $a0, $fp, -95
	bl output
# br label %label24
	b .main_label24
.main_label24:
# br label %label14
	b .main_label14
main_exit:
	addi.d $sp, $sp, 96
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
