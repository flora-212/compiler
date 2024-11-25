# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl n
	.type n, @object
	.size n, 4
n:
	.space 4
	.globl m
	.type m, @object
	.size m, 4
m:
	.space 4
	.globl w
	.type w, @object
	.size w, 20
w:
	.space 20
	.globl v
	.type v, @object
	.size v, 20
v:
	.space 20
	.globl dp
	.type dp, @object
	.size dp, 264
dp:
	.space 264
	.text
	.globl max
	.type max, @function
max:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.max_label_entry:
# %op2 = alloca i32
	addi.d $t0, $fp, -32
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -32
# store i32 %arg0, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op3 = alloca i32
	addi.d $t0, $fp, -44
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -44
# store i32 %arg1, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
# %op4 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -52
# %op5 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -56
# %op6 = icmp sgt i32 %op4, %op5
	ld.w $t0, $fp, -52
	ld.w $t1, $fp, -56
	slt $t2, $t1, $t0
	st.b $t2, $fp, -57
# br i1 %op6, label %label7, label %label9
	ld.b $a0, $fp, -57
	bnez $a0, .max_label7
	b .max_label9
.max_label7:
# %op8 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -61
# ret i32 %op8
	ld.w $a0, $fp, -61
	b max_exit
.max_label9:
# %op10 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -65
# ret i32 %op10
	ld.w $a0, $fp, -65
	b max_exit
.max_label11:
# ret i32 0
	addi.w $a0, $zero, 0
	b max_exit
max_exit:
	addi.d $sp, $sp, 80
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
	ld.w $a0, $fp, -20
	ld.w $a1, $fp, -24
	.globl knapsack
	.type knapsack, @function
knapsack:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -304
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.knapsack_label_entry:
# %op2 = alloca i32
	addi.d $t0, $fp, -32
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -32
# store i32 %arg0, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op3 = alloca i32
	addi.d $t0, $fp, -44
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -44
# store i32 %arg1, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
# %op4 = alloca i32
	addi.d $t0, $fp, -56
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -56
# %op5 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -64
# %op6 = icmp sle i32 %op5, 0
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	xor $t3, $t0, $t1
	sltu $t3, $zero, $t3
	xori $t3, $t3, 1
	or $t2, $t3, $t2
	st.b $t2, $fp, -65
# br i1 %op6, label %label7, label %label8
	ld.b $a0, $fp, -65
	bnez $a0, .knapsack_label7
	b .knapsack_label8
.knapsack_label7:
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsack_exit
.knapsack_label8:
# br label %label9
	b .knapsack_label9
.knapsack_label9:
# %op10 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -69
# %op11 = icmp eq i32 %op10, 0
	ld.w $t0, $fp, -69
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t3, $zero, $t2
	xori $t2, $t3, 1
	st.b $t2, $fp, -70
# br i1 %op11, label %label12, label %label13
	ld.b $a0, $fp, -70
	bnez $a0, .knapsack_label12
	b .knapsack_label13
.knapsack_label12:
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsack_exit
.knapsack_label13:
# br label %label14
	b .knapsack_label14
.knapsack_label14:
# %op15 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -74
# %op16 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -78
# %op17 = mul i32 %op16, 11
	ld.w $t0, $fp, -78
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -82
# %op18 = add i32 %op17, %op15
	ld.w $t0, $fp, -82
	ld.w $t1, $fp, -74
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -86
# %op19 = icmp slt i32 %op18, 0
	ld.w $t0, $fp, -86
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -87
# br i1 %op19, label %label20, label %label21
	ld.b $a0, $fp, -87
	bnez $a0, .knapsack_label20
	b .knapsack_label21
.knapsack_label20:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label21
	b .knapsack_label21
.knapsack_label21:
# %op22 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op18
	la.local $t0, dp
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -86
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -95
# %op23 = load i32, i32* %op22
	ld.d $t0, $fp, -95
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -99
# %op24 = icmp sge i32 %op23, 0
	ld.w $t0, $fp, -99
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	xor $t3, $t0, $t1
	sltu $t3, $zero, $t3
	xori $t3, $t3, 1
	or $t2, $t3, $t2
	st.b $t2, $fp, -100
# br i1 %op24, label %label25, label %label31
	ld.b $a0, $fp, -100
	bnez $a0, .knapsack_label25
	b .knapsack_label31
.knapsack_label25:
# %op26 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -104
# %op27 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -108
# %op28 = mul i32 %op27, 11
	ld.w $t0, $fp, -108
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -112
# %op29 = add i32 %op28, %op26
	ld.w $t0, $fp, -112
	ld.w $t1, $fp, -104
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# %op30 = icmp slt i32 %op29, 0
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -117
# br i1 %op30, label %label37, label %label38
	ld.b $a0, $fp, -117
	bnez $a0, .knapsack_label37
	b .knapsack_label38
.knapsack_label31:
# br label %label32
	b .knapsack_label32
.knapsack_label32:
# %op33 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -121
# %op34 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -125
# %op35 = sub i32 %op34, 1
	ld.w $t0, $fp, -125
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -129
# %op36 = icmp slt i32 %op35, 0
	ld.w $t0, $fp, -129
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -130
# br i1 %op36, label %label41, label %label42
	ld.b $a0, $fp, -130
	bnez $a0, .knapsack_label41
	b .knapsack_label42
.knapsack_label37:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label38
	b .knapsack_label38
.knapsack_label38:
# %op39 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op29
	la.local $t0, dp
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -116
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -138
# %op40 = load i32, i32* %op39
	ld.d $t0, $fp, -138
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -142
# ret i32 %op40
	ld.w $a0, $fp, -142
	b knapsack_exit
.knapsack_label41:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label42
	b .knapsack_label42
.knapsack_label42:
# %op43 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op35
	la.local $t0, w
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -129
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -150
# %op44 = load i32, i32* %op43
	ld.d $t0, $fp, -150
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -154
# %op45 = icmp slt i32 %op33, %op44
	ld.w $t0, $fp, -121
	ld.w $t1, $fp, -154
	slt $t2, $t0, $t1
	st.b $t2, $fp, -155
# br i1 %op45, label %label46, label %label51
	ld.b $a0, $fp, -155
	bnez $a0, .knapsack_label46
	b .knapsack_label51
.knapsack_label46:
# %op47 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -159
# %op48 = sub i32 %op47, 1
	ld.w $t0, $fp, -159
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -163
# %op49 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -167
# %op50 = call i32 @knapsack(i32 %op48, i32 %op49)
	ld.w $a0, $fp, -163
	ld.w $a1, $fp, -167
	bl knapsack
	st.w $a0, $fp, -171
# store i32 %op50, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -171
	st.w $t1, $t0, 0
# br label %label59
	b .knapsack_label59
.knapsack_label51:
# %op52 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -175
# %op53 = sub i32 %op52, 1
	ld.w $t0, $fp, -175
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -179
# %op54 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -183
# %op55 = call i32 @knapsack(i32 %op53, i32 %op54)
	ld.w $a0, $fp, -179
	ld.w $a1, $fp, -183
	bl knapsack
	st.w $a0, $fp, -187
# %op56 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -191
# %op57 = sub i32 %op56, 1
	ld.w $t0, $fp, -191
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -195
# %op58 = icmp slt i32 %op57, 0
	ld.w $t0, $fp, -195
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -196
# br i1 %op58, label %label65, label %label66
	ld.b $a0, $fp, -196
	bnez $a0, .knapsack_label65
	b .knapsack_label66
.knapsack_label59:
# %op60 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -200
# %op61 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -204
# %op62 = mul i32 %op61, 11
	ld.w $t0, $fp, -204
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -208
# %op63 = add i32 %op62, %op60
	ld.w $t0, $fp, -208
	ld.w $t1, $fp, -200
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -212
# %op64 = icmp slt i32 %op63, 0
	ld.w $t0, $fp, -212
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -213
# br i1 %op64, label %label83, label %label84
	ld.b $a0, $fp, -213
	bnez $a0, .knapsack_label83
	b .knapsack_label84
.knapsack_label65:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label66
	b .knapsack_label66
.knapsack_label66:
# %op67 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 %op57
	la.local $t0, v
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -195
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -221
# %op68 = load i32, i32* %op67
	ld.d $t0, $fp, -221
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -225
# %op69 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -229
# %op70 = sub i32 %op69, 1
	ld.w $t0, $fp, -229
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -233
# %op71 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -237
# %op72 = sub i32 %op71, 1
	ld.w $t0, $fp, -237
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -241
# %op73 = icmp slt i32 %op72, 0
	ld.w $t0, $fp, -241
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -242
# br i1 %op73, label %label74, label %label75
	ld.b $a0, $fp, -242
	bnez $a0, .knapsack_label74
	b .knapsack_label75
.knapsack_label74:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label75
	b .knapsack_label75
.knapsack_label75:
# %op76 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op72
	la.local $t0, w
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -241
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -250
# %op77 = load i32, i32* %op76
	ld.d $t0, $fp, -250
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -254
# %op78 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -258
# %op79 = sub i32 %op78, %op77
	ld.w $t0, $fp, -258
	ld.w $t1, $fp, -254
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -262
# %op80 = call i32 @knapsack(i32 %op70, i32 %op79)
	ld.w $a0, $fp, -233
	ld.w $a1, $fp, -262
	bl knapsack
	st.w $a0, $fp, -266
# %op81 = add i32 %op80, %op68
	ld.w $t0, $fp, -266
	ld.w $t1, $fp, -225
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -270
# %op82 = call i32 @max(i32 %op55, i32 %op81)
	ld.w $a0, $fp, -187
	ld.w $a1, $fp, -270
	bl max
	st.w $a0, $fp, -274
# store i32 %op82, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -274
	st.w $t1, $t0, 0
# br label %label59
	b .knapsack_label59
.knapsack_label83:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label84
	b .knapsack_label84
.knapsack_label84:
# %op85 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op63
	la.local $t0, dp
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -212
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -282
# %op86 = load i32, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -286
# store i32 %op86, i32* %op85
	ld.d $t0, $fp, -282
	ld.w $t1, $fp, -286
	st.w $t1, $t0, 0
# %op87 = load i32, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -290
# ret i32 %op87
	ld.w $a0, $fp, -290
	b knapsack_exit
knapsack_exit:
	addi.d $sp, $sp, 304
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
	ld.w $a0, $fp, -20
	ld.w $a1, $fp, -24
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -176
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -24
	addi.d $t1, $t0,-4
	st.d $t1, $fp, -24
# store i32 0, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 5, i32* @n
	la.local $t0, n
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# store i32 10, i32* @m
	la.local $t0, m
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# %op1 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -29
# br i1 %op1, label %label2, label %label3
	ld.b $a0, $fp, -29
	bnez $a0, .main_label2
	b .main_label3
.main_label2:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label3
	b .main_label3
.main_label3:
# %op4 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 0
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 0
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -37
# store i32 2, i32* %op4
	ld.d $t0, $fp, -37
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op5 = icmp slt i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -38
# br i1 %op5, label %label6, label %label7
	ld.b $a0, $fp, -38
	bnez $a0, .main_label6
	b .main_label7
.main_label6:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label7
	b .main_label7
.main_label7:
# %op8 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 1
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 1
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -46
# store i32 2, i32* %op8
	ld.d $t0, $fp, -46
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op9 = icmp slt i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -47
# br i1 %op9, label %label10, label %label11
	ld.b $a0, $fp, -47
	bnez $a0, .main_label10
	b .main_label11
.main_label10:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label11
	b .main_label11
.main_label11:
# %op12 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 2
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 2
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -55
# store i32 6, i32* %op12
	ld.d $t0, $fp, -55
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op13 = icmp slt i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -56
# br i1 %op13, label %label14, label %label15
	ld.b $a0, $fp, -56
	bnez $a0, .main_label14
	b .main_label15
.main_label14:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label15
	b .main_label15
.main_label15:
# %op16 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 3
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 3
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -64
# store i32 5, i32* %op16
	ld.d $t0, $fp, -64
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op17 = icmp slt i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -65
# br i1 %op17, label %label18, label %label19
	ld.b $a0, $fp, -65
	bnez $a0, .main_label18
	b .main_label19
.main_label18:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label19
	b .main_label19
.main_label19:
# %op20 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 4
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -73
# store i32 4, i32* %op20
	ld.d $t0, $fp, -73
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op21 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -74
# br i1 %op21, label %label22, label %label23
	ld.b $a0, $fp, -74
	bnez $a0, .main_label22
	b .main_label23
.main_label22:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label23
	b .main_label23
.main_label23:
# %op24 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 0
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 0
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -82
# store i32 6, i32* %op24
	ld.d $t0, $fp, -82
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op25 = icmp slt i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -83
# br i1 %op25, label %label26, label %label27
	ld.b $a0, $fp, -83
	bnez $a0, .main_label26
	b .main_label27
.main_label26:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label27
	b .main_label27
.main_label27:
# %op28 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 1
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 1
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -91
# store i32 3, i32* %op28
	ld.d $t0, $fp, -91
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
# %op29 = icmp slt i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -92
# br i1 %op29, label %label30, label %label31
	ld.b $a0, $fp, -92
	bnez $a0, .main_label30
	b .main_label31
.main_label30:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label31
	b .main_label31
.main_label31:
# %op32 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 2
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 2
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -100
# store i32 5, i32* %op32
	ld.d $t0, $fp, -100
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op33 = icmp slt i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -101
# br i1 %op33, label %label34, label %label35
	ld.b $a0, $fp, -101
	bnez $a0, .main_label34
	b .main_label35
.main_label34:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label35
	b .main_label35
.main_label35:
# %op36 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 3
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 3
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -109
# store i32 4, i32* %op36
	ld.d $t0, $fp, -109
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op37 = icmp slt i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -110
# br i1 %op37, label %label38, label %label39
	ld.b $a0, $fp, -110
	bnez $a0, .main_label38
	b .main_label39
.main_label38:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label39
	b .main_label39
.main_label39:
# %op40 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 4
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -118
# store i32 6, i32* %op40
	ld.d $t0, $fp, -118
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# br label %label41
	b .main_label41
.main_label41:
# %op42 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -122
# %op43 = icmp slt i32 %op42, 66
	ld.w $t0, $fp, -122
	addi.w $t1, $zero, 66
	slt $t2, $t0, $t1
	st.b $t2, $fp, -123
# %op44 = zext i1 %op43 to i32
	ld.b $t0, $fp, -123
	st.w $t0, $fp, -127
# %op45 = icmp ne i32 %op44, 0
	ld.w $t0, $fp, -127
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -128
# br i1 %op45, label %label46, label %label49
	ld.b $a0, $fp, -128
	bnez $a0, .main_label46
	b .main_label49
.main_label46:
# %op47 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -132
# %op48 = icmp slt i32 %op47, 0
	ld.w $t0, $fp, -132
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -133
# br i1 %op48, label %label53, label %label54
	ld.b $a0, $fp, -133
	bnez $a0, .main_label53
	b .main_label54
.main_label49:
# %op50 = load i32, i32* @n
	la.local $t0, n
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -137
# %op51 = load i32, i32* @m
	la.local $t0, m
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -141
# %op52 = call i32 @knapsack(i32 %op50, i32 %op51)
	ld.w $a0, $fp, -137
	ld.w $a1, $fp, -141
	bl knapsack
	st.w $a0, $fp, -145
# call void @output(i32 %op52)
	ld.w $a0, $fp, -145
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
.main_label53:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label54
	b .main_label54
.main_label54:
# %op55 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op47
	la.local $t0, dp
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -132
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -153
# %op56 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -157
# store i32 %op56, i32* %op55
	ld.d $t0, $fp, -153
	ld.w $t1, $fp, -157
	st.w $t1, $t0, 0
# %op57 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -161
# %op58 = add i32 %op57, 1
	ld.w $t0, $fp, -161
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -165
# store i32 %op58, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -165
	st.w $t1, $t0, 0
# br label %label41
	b .main_label41
main_exit:
	addi.d $sp, $sp, 176
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
