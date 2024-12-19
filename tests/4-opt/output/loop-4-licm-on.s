	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -240
.main_label_entry:
# br label %label88
	b .main_label88
.main_label0:
# %op1 = phi i32 [ %op9, %label15 ], [ undef, %label88 ]
# %op2 = phi i32 [ 0, %label88 ], [ %op16, %label15 ]
# %op3 = icmp slt i32 %op2, 1000000
	ld.w $t0, $fp, -24
	lu12i.w $t1, 244
	ori $t1, $t1, 576
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
# br i1 %op5, label %label6, label %label7
	ld.b $a0, $fp, -30
	bnez $a0, .main_label6
	b .main_label7
.main_label6:
# br label %label87
	b .main_label87
.main_label7:
# call void @output(i32 %op1)
	ld.w $a0, $fp, -20
	bl output
# ret void
	add.w $a0, $zero, $zero
	b main_exit
.main_label8:
# %op9 = phi i32 [ %op1, %label87 ], [ %op18, %label25 ]
# %op10 = phi i32 [ 0, %label87 ], [ %op26, %label25 ]
# %op11 = icmp slt i32 %op10, 2
	ld.w $t0, $fp, -38
	addi.w $t1, $zero, 2
	slt $t2, $t0, $t1
	st.b $t2, $fp, -39
# %op12 = zext i1 %op11 to i32
	ld.b $t0, $fp, -39
	st.w $t0, $fp, -43
# %op13 = icmp ne i32 %op12, 0
	ld.w $t0, $fp, -43
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -44
# br i1 %op13, label %label14, label %label15
	ld.b $a0, $fp, -44
	bnez $a0, .main_label14
	b .main_label15
.main_label14:
# br label %label86
	b .main_label86
.main_label15:
# %op16 = add i32 %op2, 1
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -48
# br label %label0
	ld.w $a0, $fp, -34
	st.w $a0, $fp, -20
	ld.w $a0, $fp, -48
	st.w $a0, $fp, -24
	b .main_label0
.main_label17:
# %op18 = phi i32 [ %op9, %label86 ], [ %op28, %label35 ]
# %op19 = phi i32 [ %op10, %label86 ], [ %op29, %label35 ]
# %op20 = phi i32 [ 0, %label86 ], [ %op36, %label35 ]
# %op21 = icmp slt i32 %op20, 2
	ld.w $t0, $fp, -60
	addi.w $t1, $zero, 2
	slt $t2, $t0, $t1
	st.b $t2, $fp, -61
# %op22 = zext i1 %op21 to i32
	ld.b $t0, $fp, -61
	st.w $t0, $fp, -65
# %op23 = icmp ne i32 %op22, 0
	ld.w $t0, $fp, -65
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -66
# br i1 %op23, label %label24, label %label25
	ld.b $a0, $fp, -66
	bnez $a0, .main_label24
	b .main_label25
.main_label24:
# br label %label85
	b .main_label85
.main_label25:
# %op26 = add i32 %op19, 1
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -70
# br label %label8
	ld.w $a0, $fp, -52
	st.w $a0, $fp, -34
	ld.w $a0, $fp, -70
	st.w $a0, $fp, -38
	b .main_label8
.main_label27:
# %op28 = phi i32 [ %op18, %label85 ], [ %op38, %label45 ]
# %op29 = phi i32 [ %op19, %label85 ], [ %op39, %label45 ]
# %op30 = phi i32 [ 0, %label85 ], [ %op46, %label45 ]
# %op31 = icmp slt i32 %op30, 2
	ld.w $t0, $fp, -82
	addi.w $t1, $zero, 2
	slt $t2, $t0, $t1
	st.b $t2, $fp, -83
# %op32 = zext i1 %op31 to i32
	ld.b $t0, $fp, -83
	st.w $t0, $fp, -87
# %op33 = icmp ne i32 %op32, 0
	ld.w $t0, $fp, -87
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -88
# br i1 %op33, label %label34, label %label35
	ld.b $a0, $fp, -88
	bnez $a0, .main_label34
	b .main_label35
.main_label34:
# br label %label84
	b .main_label84
.main_label35:
# %op36 = add i32 %op20, 1
	ld.w $t0, $fp, -60
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -92
# br label %label17
	ld.w $a0, $fp, -74
	st.w $a0, $fp, -52
	ld.w $a0, $fp, -78
	st.w $a0, $fp, -56
	ld.w $a0, $fp, -92
	st.w $a0, $fp, -60
	b .main_label17
.main_label37:
# %op38 = phi i32 [ %op28, %label84 ], [ %op48, %label56 ]
# %op39 = phi i32 [ %op29, %label84 ], [ %op49, %label56 ]
# %op40 = phi i32 [ 0, %label84 ], [ %op57, %label56 ]
# %op41 = icmp slt i32 %op40, 2
	ld.w $t0, $fp, -104
	addi.w $t1, $zero, 2
	slt $t2, $t0, $t1
	st.b $t2, $fp, -105
# %op42 = zext i1 %op41 to i32
	ld.b $t0, $fp, -105
	st.w $t0, $fp, -109
# %op43 = icmp ne i32 %op42, 0
	ld.w $t0, $fp, -109
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -110
# br i1 %op43, label %label44, label %label45
	ld.b $a0, $fp, -110
	bnez $a0, .main_label44
	b .main_label45
.main_label44:
# br label %label83
	b .main_label83
.main_label45:
# %op46 = add i32 %op30, 1
	ld.w $t0, $fp, -82
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -114
# br label %label27
	ld.w $a0, $fp, -96
	st.w $a0, $fp, -74
	ld.w $a0, $fp, -100
	st.w $a0, $fp, -78
	ld.w $a0, $fp, -114
	st.w $a0, $fp, -82
	b .main_label27
.main_label47:
# %op48 = phi i32 [ %op38, %label83 ], [ %op81, %label61 ]
# %op49 = phi i32 [ %op39, %label83 ], [ %op62, %label61 ]
# %op50 = phi i32 [ 0, %label83 ], [ %op82, %label61 ]
# %op51 = icmp slt i32 %op50, 2
	ld.w $t0, $fp, -126
	addi.w $t1, $zero, 2
	slt $t2, $t0, $t1
	st.b $t2, $fp, -127
# %op52 = zext i1 %op51 to i32
	ld.b $t0, $fp, -127
	st.w $t0, $fp, -131
# %op53 = icmp ne i32 %op52, 0
	ld.w $t0, $fp, -131
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -132
# br i1 %op53, label %label54, label %label56
	ld.b $a0, $fp, -132
	bnez $a0, .main_label54
	b .main_label56
.main_label54:
# br i1 %op55, label %label58, label %label60
	ld.b $a0, $fp, -225
	bnez $a0, .main_label58
	b .main_label60
.main_label56:
# %op57 = add i32 %op40, 1
	ld.w $t0, $fp, -104
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -136
# br label %label37
	ld.w $a0, $fp, -118
	st.w $a0, $fp, -96
	ld.w $a0, $fp, -122
	st.w $a0, $fp, -100
	ld.w $a0, $fp, -136
	st.w $a0, $fp, -104
	b .main_label37
.main_label58:
# %op59 = add i32 %op49, 1
	ld.w $t0, $fp, -122
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -140
# br label %label61
	ld.w $a0, $fp, -140
	st.w $a0, $fp, -144
	b .main_label61
.main_label60:
# br label %label61
	ld.w $a0, $fp, -122
	st.w $a0, $fp, -144
	b .main_label61
.main_label61:
# %op62 = phi i32 [ %op59, %label58 ], [ %op49, %label60 ]
# %op82 = add i32 %op50, 1
	ld.w $t0, $fp, -126
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -148
# br label %label47
	ld.w $a0, $fp, -152
	st.w $a0, $fp, -118
	ld.w $a0, $fp, -144
	st.w $a0, $fp, -122
	ld.w $a0, $fp, -148
	st.w $a0, $fp, -126
	b .main_label47
.main_label83:
# br label %label47
	ld.w $a0, $fp, -96
	st.w $a0, $fp, -118
	ld.w $a0, $fp, -100
	st.w $a0, $fp, -122
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -126
	b .main_label47
.main_label84:
# br label %label37
	ld.w $a0, $fp, -74
	st.w $a0, $fp, -96
	ld.w $a0, $fp, -78
	st.w $a0, $fp, -100
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -104
	b .main_label37
.main_label85:
# br label %label27
	ld.w $a0, $fp, -52
	st.w $a0, $fp, -74
	ld.w $a0, $fp, -56
	st.w $a0, $fp, -78
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -82
	b .main_label27
.main_label86:
# br label %label17
	ld.w $a0, $fp, -34
	st.w $a0, $fp, -52
	ld.w $a0, $fp, -38
	st.w $a0, $fp, -56
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -60
	b .main_label17
.main_label87:
# br label %label8
	ld.w $a0, $fp, -20
	st.w $a0, $fp, -34
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -38
	b .main_label8
.main_label88:
# %op81 = sdiv i32 %op80, 2
	ld.w $t0, $fp, -156
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -152
# %op80 = sdiv i32 %op79, 2
	ld.w $t0, $fp, -160
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -156
# %op79 = sdiv i32 %op78, 2
	ld.w $t0, $fp, -164
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -160
# %op78 = sdiv i32 %op77, 2
	ld.w $t0, $fp, -168
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -164
# %op77 = sdiv i32 %op76, 2
	ld.w $t0, $fp, -172
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -168
# %op76 = sdiv i32 %op75, 2
	ld.w $t0, $fp, -176
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -172
# %op75 = sdiv i32 %op74, 2
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -176
# %op74 = sdiv i32 %op73, 2
	ld.w $t0, $fp, -184
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -180
# %op73 = sdiv i32 %op72, 2
	ld.w $t0, $fp, -188
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -184
# %op72 = sdiv i32 %op71, 2
	ld.w $t0, $fp, -192
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -188
# %op71 = mul i32 %op70, 2
	ld.w $t0, $fp, -196
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -192
# %op70 = mul i32 %op69, 2
	ld.w $t0, $fp, -200
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -196
# %op69 = mul i32 %op68, 2
	ld.w $t0, $fp, -204
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -200
# %op68 = mul i32 %op67, 2
	ld.w $t0, $fp, -208
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -204
# %op67 = mul i32 %op66, 2
	ld.w $t0, $fp, -212
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -208
# %op66 = mul i32 %op65, 2
	ld.w $t0, $fp, -216
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -212
# %op65 = mul i32 %op64, 2
	ld.w $t0, $fp, -220
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -216
# %op64 = mul i32 %op63, 2
	ld.w $t0, $fp, -224
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -220
# %op63 = mul i32 2, 2
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -224
# %op55 = icmp sgt i32 2, 1
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -225
# br label %label0
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -24
	b .main_label0
main_exit:
	addi.d $sp, $sp, 240
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
