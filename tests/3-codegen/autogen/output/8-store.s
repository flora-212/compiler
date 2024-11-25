	.text
	.globl store
	.type store, @function
store:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -112
	st.d $a0, $fp, -24
	st.w $a1, $fp, -28
	st.w $a2, $fp, -32
.store_label_entry:
# %op3 = alloca i32*
	addi.d $t0, $fp, -40
	addi.d $t1, $t0,-8
	st.d $t1, $fp, -40
# store i32* %arg0, i32** %op3
	ld.d $t0, $fp, -40
	ld.d $t1, $fp, -24
	st.d $t1, $t0, 0
# %op4 = load i32*, i32** %op3
	ld.d $t0, $fp, -40
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -56
# %op5 = alloca i32
	addi.d $t0, $fp, -64
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -64
# store i32 %arg1, i32* %op5
	ld.d $t0, $fp, -64
	ld.w $t1, $fp, -28
	st.w $t1, $t0, 0
# %op6 = alloca i32
	addi.d $t0, $fp, -76
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -76
# store i32 %arg2, i32* %op6
	ld.d $t0, $fp, -76
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
# %op7 = load i32, i32* %op5
	ld.d $t0, $fp, -64
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -84
# %op8 = icmp slt i32 %op7, 0
	ld.w $t0, $fp, -84
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -85
# br i1 %op8, label %label9, label %label10
	ld.b $a0, $fp, -85
	bnez $a0, .store_label9
	b .store_label10
.store_label9:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label10
	b .store_label10
.store_label10:
# %op11 = getelementptr i32, i32* %op4, i32 %op7
	ld.d $t0, $fp, -56
	st.d $t0, $fp, -93
	ld.w $t1, $fp, -84
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -93
# %op12 = load i32, i32* %op6
	ld.d $t0, $fp, -76
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -97
# store i32 %op12, i32* %op11
	ld.d $t0, $fp, -93
	ld.w $t1, $fp, -97
	st.w $t1, $t0, 0
# %op13 = load i32, i32* %op6
	ld.d $t0, $fp, -76
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -101
# ret i32 %op13
	ld.w $a0, $fp, -101
	b store_exit
store_exit:
	addi.d $sp, $sp, 112
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
	ld.d $a0, $fp, -24
	ld.w $a1, $fp, -28
	ld.w $a2, $fp, -32
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -192
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t0, $fp, -24
	addi.d $t1, $t0,-40
	st.d $t1, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -72
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -72
# %op2 = alloca i32
	addi.d $t0, $fp, -84
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -84
# store i32 0, i32* %op1
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label3
	b .main_label3
.main_label3:
# %op4 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -92
# %op5 = icmp slt i32 %op4, 10
	ld.w $t0, $fp, -92
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	st.b $t2, $fp, -93
# %op6 = zext i1 %op5 to i32
	ld.b $t0, $fp, -93
	st.w $t0, $fp, -97
# %op7 = icmp ne i32 %op6, 0
	ld.w $t0, $fp, -97
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -98
# br i1 %op7, label %label8, label %label16
	ld.b $a0, $fp, -98
	bnez $a0, .main_label8
	b .main_label16
.main_label8:
# %op9 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 0
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -106
# %op10 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -110
# %op11 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -114
# %op12 = mul i32 %op11, 2
	ld.w $t0, $fp, -114
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -118
# %op13 = call i32 @store(i32* %op9, i32 %op10, i32 %op12)
	ld.d $a0, $fp, -106
	ld.w $a1, $fp, -110
	ld.w $a2, $fp, -118
	bl store
	st.w $a0, $fp, -122
# %op14 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -126
# %op15 = add i32 %op14, 1
	ld.w $t0, $fp, -126
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -130
# store i32 %op15, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -130
	st.w $t1, $t0, 0
# br label %label3
	b .main_label3
.main_label16:
# store i32 0, i32* %op2
	ld.d $t0, $fp, -84
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op1
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label17
	b .main_label17
.main_label17:
# %op18 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -134
# %op19 = icmp slt i32 %op18, 10
	ld.w $t0, $fp, -134
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	st.b $t2, $fp, -135
# %op20 = zext i1 %op19 to i32
	ld.b $t0, $fp, -135
	st.w $t0, $fp, -139
# %op21 = icmp ne i32 %op20, 0
	ld.w $t0, $fp, -139
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -140
# br i1 %op21, label %label22, label %label25
	ld.b $a0, $fp, -140
	bnez $a0, .main_label22
	b .main_label25
.main_label22:
# %op23 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -144
# %op24 = icmp slt i32 %op23, 0
	ld.w $t0, $fp, -144
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -145
# br i1 %op24, label %label27, label %label28
	ld.b $a0, $fp, -145
	bnez $a0, .main_label27
	b .main_label28
.main_label25:
# %op26 = load i32, i32* %op2
	ld.d $t0, $fp, -84
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -149
# call void @output(i32 %op26)
	ld.w $a0, $fp, -149
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
.main_label27:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label28
	b .main_label28
.main_label28:
# %op29 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 %op23
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -144
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -157
# %op30 = load i32, i32* %op29
	ld.d $t0, $fp, -157
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -161
# %op31 = load i32, i32* %op2
	ld.d $t0, $fp, -84
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -165
# %op32 = add i32 %op31, %op30
	ld.w $t0, $fp, -165
	ld.w $t1, $fp, -161
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -169
# store i32 %op32, i32* %op2
	ld.d $t0, $fp, -84
	ld.w $t1, $fp, -169
	st.w $t1, $t0, 0
# %op33 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -173
# %op34 = add i32 %op33, 1
	ld.w $t0, $fp, -173
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -177
# store i32 %op34, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -177
	st.w $t1, $t0, 0
# br label %label17
	b .main_label17
main_exit:
	addi.d $sp, $sp, 192
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
