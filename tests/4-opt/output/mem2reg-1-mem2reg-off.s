	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -336
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
# %op3 = alloca i32
	addi.d $t0, $fp, -60
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -60
# %op4 = alloca i32
	addi.d $t0, $fp, -72
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -72
# %op5 = alloca i32
	addi.d $t0, $fp, -84
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -84
# %op6 = alloca i32
	addi.d $t0, $fp, -96
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -96
# %op7 = call i32 @input()
	bl input
	st.w $a0, $fp, -104
# store i32 %op7, i32* %op6
	ld.d $t0, $fp, -96
	ld.w $t1, $fp, -104
	st.w $t1, $t0, 0
# store i32 0, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op5
	ld.d $t0, $fp, -84
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label8
	b .main_label8
.main_label8:
# %op9 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -108
# %op10 = load i32, i32* %op6
	ld.d $t0, $fp, -96
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -112
# %op11 = icmp slt i32 %op9, %op10
	ld.w $t0, $fp, -108
	ld.w $t1, $fp, -112
	slt $t2, $t0, $t1
	st.b $t2, $fp, -113
# %op12 = zext i1 %op11 to i32
	ld.b $t0, $fp, -113
	st.w $t0, $fp, -117
# %op13 = icmp ne i32 %op12, 0
	ld.w $t0, $fp, -117
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -118
# br i1 %op13, label %label14, label %label66
	ld.b $a0, $fp, -118
	bnez $a0, .main_label14
	b .main_label66
.main_label14:
# %op15 = fmul float 0x3ff3c0c200000000, 0x4016f06a20000000
	lu12i.w $t8, 260576
	ori $t8, $t8, 1552
	movgr2fr.w $ft0, $t8
	lu12i.w $t8, 265080
	ori $t8, $t8, 849
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -122
# %op16 = fmul float %op15, 0x4002aa9940000000
	fld.s $ft0, $fp, -122
	lu12i.w $t8, 262485
	ori $t8, $t8, 1226
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -126
# %op17 = fmul float %op16, 0x4011781d80000000
	fld.s $ft0, $fp, -126
	lu12i.w $t8, 264380
	ori $t8, $t8, 236
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -130
# %op18 = fmul float %op17, 0x401962ac40000000
	fld.s $ft0, $fp, -130
	lu12i.w $t8, 265393
	ori $t8, $t8, 1378
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -134
# %op19 = fptosi float %op18 to i32
	fld.s $ft0, $fp, -134
	ftintrz.w.s $ft1, $ft0
	movfr2gr.s $t0, $ft1
	st.w $t0, $fp, -138
# store i32 %op19, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -138
	st.w $t1, $t0, 0
# %op20 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -142
# %op21 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -146
# %op22 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -150
# %op23 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -154
# %op24 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -158
# %op25 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -162
# %op26 = mul i32 %op25, %op24
	ld.w $t0, $fp, -162
	ld.w $t1, $fp, -158
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -166
# %op27 = mul i32 %op26, %op23
	ld.w $t0, $fp, -166
	ld.w $t1, $fp, -154
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -170
# %op28 = mul i32 %op27, %op22
	ld.w $t0, $fp, -170
	ld.w $t1, $fp, -150
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -174
# %op29 = mul i32 %op28, %op21
	ld.w $t0, $fp, -174
	ld.w $t1, $fp, -146
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -178
# %op30 = mul i32 %op29, %op20
	ld.w $t0, $fp, -178
	ld.w $t1, $fp, -142
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -182
# store i32 %op30, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -182
	st.w $t1, $t0, 0
# %op31 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -186
# %op32 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -190
# %op33 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -194
# %op34 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -198
# %op35 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -202
# %op36 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -206
# %op37 = mul i32 %op36, %op35
	ld.w $t0, $fp, -206
	ld.w $t1, $fp, -202
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -210
# %op38 = mul i32 %op37, %op34
	ld.w $t0, $fp, -210
	ld.w $t1, $fp, -198
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -214
# %op39 = mul i32 %op38, %op33
	ld.w $t0, $fp, -214
	ld.w $t1, $fp, -194
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -218
# %op40 = mul i32 %op39, %op32
	ld.w $t0, $fp, -218
	ld.w $t1, $fp, -190
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -222
# %op41 = mul i32 %op40, %op31
	ld.w $t0, $fp, -222
	ld.w $t1, $fp, -186
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -226
# store i32 %op41, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t1, $fp, -226
	st.w $t1, $t0, 0
# %op42 = load i32, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -230
# %op43 = load i32, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -234
# %op44 = load i32, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -238
# %op45 = load i32, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -242
# %op46 = load i32, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -246
# %op47 = load i32, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -250
# %op48 = mul i32 %op47, %op46
	ld.w $t0, $fp, -250
	ld.w $t1, $fp, -246
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -254
# %op49 = mul i32 %op48, %op45
	ld.w $t0, $fp, -254
	ld.w $t1, $fp, -242
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -258
# %op50 = mul i32 %op49, %op44
	ld.w $t0, $fp, -258
	ld.w $t1, $fp, -238
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -262
# %op51 = mul i32 %op50, %op43
	ld.w $t0, $fp, -262
	ld.w $t1, $fp, -234
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -266
# %op52 = mul i32 %op51, %op42
	ld.w $t0, $fp, -266
	ld.w $t1, $fp, -230
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -270
# store i32 %op52, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -270
	st.w $t1, $t0, 0
# %op53 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -274
# %op54 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -278
# %op55 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -282
# %op56 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -286
# %op57 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -290
# %op58 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -294
# %op59 = mul i32 %op58, %op57
	ld.w $t0, $fp, -294
	ld.w $t1, $fp, -290
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -298
# %op60 = mul i32 %op59, %op56
	ld.w $t0, $fp, -298
	ld.w $t1, $fp, -286
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -302
# %op61 = mul i32 %op60, %op55
	ld.w $t0, $fp, -302
	ld.w $t1, $fp, -282
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -306
# %op62 = mul i32 %op61, %op54
	ld.w $t0, $fp, -306
	ld.w $t1, $fp, -278
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -310
# %op63 = mul i32 %op62, %op53
	ld.w $t0, $fp, -310
	ld.w $t1, $fp, -274
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -314
# store i32 %op63, i32* %op5
	ld.d $t0, $fp, -84
	ld.w $t1, $fp, -314
	st.w $t1, $t0, 0
# %op64 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -318
# %op65 = add i32 %op64, 1
	ld.w $t0, $fp, -318
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -322
# store i32 %op65, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -322
	st.w $t1, $t0, 0
# br label %label8
	b .main_label8
.main_label66:
# %op67 = load i32, i32* %op5
	ld.d $t0, $fp, -84
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -326
# call void @output(i32 %op67)
	ld.w $a0, $fp, -326
	bl output
# ret void
	add.w $a0, $zero, $zero
	b main_exit
main_exit:
	addi.d $sp, $sp, 336
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
