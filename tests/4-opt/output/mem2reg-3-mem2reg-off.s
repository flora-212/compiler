# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl matrix
	.type matrix, @object
	.size matrix, 80000000
matrix:
	.space 80000000
	.globl ad
	.type ad, @object
	.size ad, 400000
ad:
	.space 400000
	.globl len
	.type len, @object
	.size len, 4
len:
	.space 4
	.text
	.globl readarray
	.type readarray, @function
readarray:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
.readarray_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -24
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -24
# store i32 0, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label1
	b .readarray_label1
.readarray_label1:
# %op2 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -32
# %op3 = load i32, i32* @len
	la.local $t0, len
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -36
# %op4 = icmp slt i32 %op2, %op3
	ld.w $t0, $fp, -32
	ld.w $t1, $fp, -36
	slt $t2, $t0, $t1
	st.b $t2, $fp, -37
# %op5 = zext i1 %op4 to i32
	ld.b $t0, $fp, -37
	st.w $t0, $fp, -41
# %op6 = icmp ne i32 %op5, 0
	ld.w $t0, $fp, -41
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -42
# br i1 %op6, label %label7, label %label10
	ld.b $a0, $fp, -42
	bnez $a0, .readarray_label7
	b .readarray_label10
.readarray_label7:
# %op8 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -46
# %op9 = icmp slt i32 %op8, 0
	ld.w $t0, $fp, -46
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -47
# br i1 %op9, label %label11, label %label12
	ld.b $a0, $fp, -47
	bnez $a0, .readarray_label11
	b .readarray_label12
.readarray_label10:
# ret void
	add.w $a0, $zero, $zero
	b readarray_exit
.readarray_label11:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label12
	b .readarray_label12
.readarray_label12:
# %op13 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op8
	la.local $t0, ad
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -46
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -55
# %op14 = call i32 @input()
	bl input
	st.w $a0, $fp, -59
# store i32 %op14, i32* %op13
	ld.d $t0, $fp, -55
	ld.w $t1, $fp, -59
	st.w $t1, $t0, 0
# %op15 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -63
# %op16 = add i32 %op15, 1
	ld.w $t0, $fp, -63
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -67
# store i32 %op16, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -67
	st.w $t1, $t0, 0
# br label %label1
	b .readarray_label1
readarray_exit:
	addi.d $sp, $sp, 80
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
	.globl transpose
	.type transpose, @function
transpose:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -336
	st.w $a0, $fp, -20
	st.d $a1, $fp, -28
	st.w $a2, $fp, -32
.transpose_label_entry:
# %op3 = alloca i32
	addi.d $t0, $fp, -40
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -40
# store i32 %arg0, i32* %op3
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op4 = alloca i32*
	addi.d $t0, $fp, -52
	addi.d $t1, $t0,-8
	st.d $t1, $fp, -52
# store i32* %arg1, i32** %op4
	ld.d $t0, $fp, -52
	ld.d $t1, $fp, -28
	st.d $t1, $t0, 0
# %op5 = load i32*, i32** %op4
	ld.d $t0, $fp, -52
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -68
# %op6 = alloca i32
	addi.d $t0, $fp, -76
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -76
# store i32 %arg2, i32* %op6
	ld.d $t0, $fp, -76
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
# %op7 = alloca i32
	addi.d $t0, $fp, -88
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -88
# %op8 = alloca i32
	addi.d $t0, $fp, -100
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -100
# %op9 = alloca i32
	addi.d $t0, $fp, -112
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -112
# %op10 = alloca i32
	addi.d $t0, $fp, -124
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -124
# %op11 = load i32, i32* %op6
	ld.d $t0, $fp, -76
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -132
# %op12 = load i32, i32* %op3
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -136
# %op13 = sdiv i32 %op12, %op11
	ld.w $t0, $fp, -136
	ld.w $t1, $fp, -132
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -140
# store i32 %op13, i32* %op7
	ld.d $t0, $fp, -88
	ld.w $t1, $fp, -140
	st.w $t1, $t0, 0
# store i32 0, i32* %op8
	ld.d $t0, $fp, -100
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op9
	ld.d $t0, $fp, -112
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label14
	b .transpose_label14
.transpose_label14:
# %op15 = load i32, i32* %op8
	ld.d $t0, $fp, -100
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -144
# %op16 = load i32, i32* %op7
	ld.d $t0, $fp, -88
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -148
# %op17 = icmp slt i32 %op15, %op16
	ld.w $t0, $fp, -144
	ld.w $t1, $fp, -148
	slt $t2, $t0, $t1
	st.b $t2, $fp, -149
# %op18 = zext i1 %op17 to i32
	ld.b $t0, $fp, -149
	st.w $t0, $fp, -153
# %op19 = icmp ne i32 %op18, 0
	ld.w $t0, $fp, -153
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -154
# br i1 %op19, label %label20, label %label21
	ld.b $a0, $fp, -154
	bnez $a0, .transpose_label20
	b .transpose_label21
.transpose_label20:
# store i32 0, i32* %op9
	ld.d $t0, $fp, -112
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label23
	b .transpose_label23
.transpose_label21:
# %op22 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -158
# ret i32 %op22
	ld.w $a0, $fp, -158
	b transpose_exit
.transpose_label23:
# %op24 = load i32, i32* %op9
	ld.d $t0, $fp, -112
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -162
# %op25 = load i32, i32* %op6
	ld.d $t0, $fp, -76
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -166
# %op26 = icmp slt i32 %op24, %op25
	ld.w $t0, $fp, -162
	ld.w $t1, $fp, -166
	slt $t2, $t0, $t1
	st.b $t2, $fp, -167
# %op27 = zext i1 %op26 to i32
	ld.b $t0, $fp, -167
	st.w $t0, $fp, -171
# %op28 = icmp ne i32 %op27, 0
	ld.w $t0, $fp, -171
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -172
# br i1 %op28, label %label29, label %label33
	ld.b $a0, $fp, -172
	bnez $a0, .transpose_label29
	b .transpose_label33
.transpose_label29:
# %op30 = load i32, i32* %op8
	ld.d $t0, $fp, -100
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -176
# %op31 = load i32, i32* %op9
	ld.d $t0, $fp, -112
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -180
# %op32 = icmp slt i32 %op30, %op31
	ld.w $t0, $fp, -176
	ld.w $t1, $fp, -180
	slt $t2, $t0, $t1
	st.b $t2, $fp, -181
# br i1 %op32, label %label36, label %label39
	ld.b $a0, $fp, -181
	bnez $a0, .transpose_label36
	b .transpose_label39
.transpose_label33:
# %op34 = load i32, i32* %op8
	ld.d $t0, $fp, -100
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -185
# %op35 = add i32 %op34, 1
	ld.w $t0, $fp, -185
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -189
# store i32 %op35, i32* %op8
	ld.d $t0, $fp, -100
	ld.w $t1, $fp, -189
	st.w $t1, $t0, 0
# br label %label14
	b .transpose_label14
.transpose_label36:
# %op37 = load i32, i32* %op9
	ld.d $t0, $fp, -112
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -193
# %op38 = add i32 %op37, 1
	ld.w $t0, $fp, -193
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -197
# store i32 %op38, i32* %op9
	ld.d $t0, $fp, -112
	ld.w $t1, $fp, -197
	st.w $t1, $t0, 0
# br label %label46
	b .transpose_label46
.transpose_label39:
# %op40 = load i32, i32* %op9
	ld.d $t0, $fp, -112
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -201
# %op41 = load i32, i32* %op6
	ld.d $t0, $fp, -76
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -205
# %op42 = load i32, i32* %op8
	ld.d $t0, $fp, -100
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -209
# %op43 = mul i32 %op42, %op41
	ld.w $t0, $fp, -209
	ld.w $t1, $fp, -205
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -213
# %op44 = add i32 %op43, %op40
	ld.w $t0, $fp, -213
	ld.w $t1, $fp, -201
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -217
# %op45 = icmp slt i32 %op44, 0
	ld.w $t0, $fp, -217
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -218
# br i1 %op45, label %label47, label %label48
	ld.b $a0, $fp, -218
	bnez $a0, .transpose_label47
	b .transpose_label48
.transpose_label46:
# br label %label23
	b .transpose_label23
.transpose_label47:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label48
	b .transpose_label48
.transpose_label48:
# %op49 = getelementptr i32, i32* %op5, i32 %op44
	ld.d $t0, $fp, -68
	st.d $t0, $fp, -226
	ld.w $t1, $fp, -217
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -226
# %op50 = load i32, i32* %op49
	ld.d $t0, $fp, -226
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -230
# store i32 %op50, i32* %op10
	ld.d $t0, $fp, -124
	ld.w $t1, $fp, -230
	st.w $t1, $t0, 0
# %op51 = load i32, i32* %op8
	ld.d $t0, $fp, -100
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -234
# %op52 = load i32, i32* %op7
	ld.d $t0, $fp, -88
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -238
# %op53 = load i32, i32* %op9
	ld.d $t0, $fp, -112
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -242
# %op54 = mul i32 %op53, %op52
	ld.w $t0, $fp, -242
	ld.w $t1, $fp, -238
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -246
# %op55 = add i32 %op54, %op51
	ld.w $t0, $fp, -246
	ld.w $t1, $fp, -234
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -250
# %op56 = icmp slt i32 %op55, 0
	ld.w $t0, $fp, -250
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -251
# br i1 %op56, label %label57, label %label58
	ld.b $a0, $fp, -251
	bnez $a0, .transpose_label57
	b .transpose_label58
.transpose_label57:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label58
	b .transpose_label58
.transpose_label58:
# %op59 = getelementptr i32, i32* %op5, i32 %op55
	ld.d $t0, $fp, -68
	st.d $t0, $fp, -259
	ld.w $t1, $fp, -250
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -259
# %op60 = load i32, i32* %op9
	ld.d $t0, $fp, -112
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -263
# %op61 = load i32, i32* %op6
	ld.d $t0, $fp, -76
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -267
# %op62 = load i32, i32* %op8
	ld.d $t0, $fp, -100
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -271
# %op63 = mul i32 %op62, %op61
	ld.w $t0, $fp, -271
	ld.w $t1, $fp, -267
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -275
# %op64 = add i32 %op63, %op60
	ld.w $t0, $fp, -275
	ld.w $t1, $fp, -263
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -279
# %op65 = icmp slt i32 %op64, 0
	ld.w $t0, $fp, -279
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -280
# br i1 %op65, label %label66, label %label67
	ld.b $a0, $fp, -280
	bnez $a0, .transpose_label66
	b .transpose_label67
.transpose_label66:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label67
	b .transpose_label67
.transpose_label67:
# %op68 = getelementptr i32, i32* %op5, i32 %op64
	ld.d $t0, $fp, -68
	st.d $t0, $fp, -288
	ld.w $t1, $fp, -279
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -288
# %op69 = load i32, i32* %op68
	ld.d $t0, $fp, -288
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -292
# store i32 %op69, i32* %op59
	ld.d $t0, $fp, -259
	ld.w $t1, $fp, -292
	st.w $t1, $t0, 0
# %op70 = load i32, i32* %op9
	ld.d $t0, $fp, -112
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -296
# %op71 = load i32, i32* %op6
	ld.d $t0, $fp, -76
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -300
# %op72 = load i32, i32* %op8
	ld.d $t0, $fp, -100
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -304
# %op73 = mul i32 %op72, %op71
	ld.w $t0, $fp, -304
	ld.w $t1, $fp, -300
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -308
# %op74 = add i32 %op73, %op70
	ld.w $t0, $fp, -308
	ld.w $t1, $fp, -296
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -312
# %op75 = icmp slt i32 %op74, 0
	ld.w $t0, $fp, -312
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -313
# br i1 %op75, label %label76, label %label77
	ld.b $a0, $fp, -313
	bnez $a0, .transpose_label76
	b .transpose_label77
.transpose_label76:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label77
	b .transpose_label77
.transpose_label77:
# %op78 = getelementptr i32, i32* %op5, i32 %op74
	ld.d $t0, $fp, -68
	st.d $t0, $fp, -321
	ld.w $t1, $fp, -312
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -321
# %op79 = load i32, i32* %op10
	ld.d $t0, $fp, -124
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -325
# store i32 %op79, i32* %op78
	ld.d $t0, $fp, -321
	ld.w $t1, $fp, -325
	st.w $t1, $t0, 0
# %op80 = load i32, i32* %op9
	ld.d $t0, $fp, -112
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -329
# %op81 = add i32 %op80, 1
	ld.w $t0, $fp, -329
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -333
# store i32 %op81, i32* %op9
	ld.d $t0, $fp, -112
	ld.w $t1, $fp, -333
	st.w $t1, $t0, 0
# br label %label46
	b .transpose_label46
transpose_exit:
	addi.d $sp, $sp, 336
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
	ld.w $a0, $fp, -20
	ld.d $a1, $fp, -28
	ld.w $a2, $fp, -32
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -240
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
# %op3 = call i32 @input()
	bl input
	st.w $a0, $fp, -56
# store i32 %op3, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -56
	st.w $t1, $t0, 0
# %op4 = call i32 @input()
	bl input
	st.w $a0, $fp, -60
# store i32 %op4, i32* @len
	la.local $t0, len
	ld.w $t1, $fp, -60
	st.w $t1, $t0, 0
# call void @readarray()
	bl readarray
# store i32 0, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label5
	b .main_label5
.main_label5:
# %op6 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -64
# %op7 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -68
# %op8 = icmp slt i32 %op6, %op7
	ld.w $t0, $fp, -64
	ld.w $t1, $fp, -68
	slt $t2, $t0, $t1
	st.b $t2, $fp, -69
# %op9 = zext i1 %op8 to i32
	ld.b $t0, $fp, -69
	st.w $t0, $fp, -73
# %op10 = icmp ne i32 %op9, 0
	ld.w $t0, $fp, -73
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -74
# br i1 %op10, label %label11, label %label14
	ld.b $a0, $fp, -74
	bnez $a0, .main_label11
	b .main_label14
.main_label11:
# %op12 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -78
# %op13 = icmp slt i32 %op12, 0
	ld.w $t0, $fp, -78
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -79
# br i1 %op13, label %label15, label %label16
	ld.b $a0, $fp, -79
	bnez $a0, .main_label15
	b .main_label16
.main_label14:
# store i32 0, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label21
	b .main_label21
.main_label15:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label16
	b .main_label16
.main_label16:
# %op17 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op12
	la.local $t0, matrix
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -78
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -87
# %op18 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -91
# store i32 %op18, i32* %op17
	ld.d $t0, $fp, -87
	ld.w $t1, $fp, -91
	st.w $t1, $t0, 0
# %op19 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -95
# %op20 = add i32 %op19, 1
	ld.w $t0, $fp, -95
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -99
# store i32 %op20, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -99
	st.w $t1, $t0, 0
# br label %label5
	b .main_label5
.main_label21:
# %op22 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -103
# %op23 = load i32, i32* @len
	la.local $t0, len
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -107
# %op24 = icmp slt i32 %op22, %op23
	ld.w $t0, $fp, -103
	ld.w $t1, $fp, -107
	slt $t2, $t0, $t1
	st.b $t2, $fp, -108
# %op25 = zext i1 %op24 to i32
	ld.b $t0, $fp, -108
	st.w $t0, $fp, -112
# %op26 = icmp ne i32 %op25, 0
	ld.w $t0, $fp, -112
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -113
# br i1 %op26, label %label27, label %label32
	ld.b $a0, $fp, -113
	bnez $a0, .main_label27
	b .main_label32
.main_label27:
# %op28 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -117
# %op29 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 0
	la.local $t0, matrix
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 0
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -125
# %op30 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -129
# %op31 = icmp slt i32 %op30, 0
	ld.w $t0, $fp, -129
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -130
# br i1 %op31, label %label33, label %label34
	ld.b $a0, $fp, -130
	bnez $a0, .main_label33
	b .main_label34
.main_label32:
# store i32 0, i32* %op2
	ld.d $t0, $fp, -48
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label40
	b .main_label40
.main_label33:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label34
	b .main_label34
.main_label34:
# %op35 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op30
	la.local $t0, ad
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -129
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -138
# %op36 = load i32, i32* %op35
	ld.d $t0, $fp, -138
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -142
# %op37 = call i32 @transpose(i32 %op28, i32* %op29, i32 %op36)
	ld.w $a0, $fp, -117
	ld.d $a1, $fp, -125
	ld.w $a2, $fp, -142
	bl transpose
	st.w $a0, $fp, -146
# %op38 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -150
# %op39 = add i32 %op38, 1
	ld.w $t0, $fp, -150
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -154
# store i32 %op39, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -154
	st.w $t1, $t0, 0
# br label %label21
	b .main_label21
.main_label40:
# %op41 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -158
# %op42 = load i32, i32* @len
	la.local $t0, len
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -162
# %op43 = icmp slt i32 %op41, %op42
	ld.w $t0, $fp, -158
	ld.w $t1, $fp, -162
	slt $t2, $t0, $t1
	st.b $t2, $fp, -163
# %op44 = zext i1 %op43 to i32
	ld.b $t0, $fp, -163
	st.w $t0, $fp, -167
# %op45 = icmp ne i32 %op44, 0
	ld.w $t0, $fp, -167
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -168
# br i1 %op45, label %label46, label %label49
	ld.b $a0, $fp, -168
	bnez $a0, .main_label46
	b .main_label49
.main_label46:
# %op47 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -172
# %op48 = icmp slt i32 %op47, 0
	ld.w $t0, $fp, -172
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -173
# br i1 %op48, label %label52, label %label53
	ld.b $a0, $fp, -173
	bnez $a0, .main_label52
	b .main_label53
.main_label49:
# %op50 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -177
# %op51 = icmp slt i32 %op50, 0
	ld.w $t0, $fp, -177
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -178
# br i1 %op51, label %label64, label %label67
	ld.b $a0, $fp, -178
	bnez $a0, .main_label64
	b .main_label67
.main_label52:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label53
	b .main_label53
.main_label53:
# %op54 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op47
	la.local $t0, matrix
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -172
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -186
# %op55 = load i32, i32* %op54
	ld.d $t0, $fp, -186
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -190
# %op56 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -194
# %op57 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -198
# %op58 = mul i32 %op57, %op56
	ld.w $t0, $fp, -198
	ld.w $t1, $fp, -194
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -202
# %op59 = mul i32 %op58, %op55
	ld.w $t0, $fp, -202
	ld.w $t1, $fp, -190
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -206
# %op60 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -210
# %op61 = add i32 %op60, %op59
	ld.w $t0, $fp, -210
	ld.w $t1, $fp, -206
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -214
# store i32 %op61, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -214
	st.w $t1, $t0, 0
# %op62 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -218
# %op63 = add i32 %op62, 1
	ld.w $t0, $fp, -218
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -222
# store i32 %op63, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -222
	st.w $t1, $t0, 0
# br label %label40
	b .main_label40
.main_label64:
# %op65 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -226
# %op66 = sub i32 0, %op65
	addi.w $t0, $zero, 0
	ld.w $t1, $fp, -226
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -230
# store i32 %op66, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -230
	st.w $t1, $t0, 0
# br label %label68
	b .main_label68
.main_label67:
# br label %label68
	b .main_label68
.main_label68:
# %op69 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -234
# call void @output(i32 %op69)
	ld.w $a0, $fp, -234
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
main_exit:
	addi.d $sp, $sp, 240
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
