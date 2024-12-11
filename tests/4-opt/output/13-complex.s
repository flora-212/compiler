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
	addi.d $sp, $sp, -32
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.max_label_entry:
# %op2 = icmp sgt i32 %arg0, %arg1
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -24
	slt $t2, $t1, $t0
	st.b $t2, $fp, -25
# br i1 %op2, label %label3, label %label4
	ld.b $a0, $fp, -25
	bnez $a0, .max_label3
	b .max_label4
.max_label3:
# ret i32 %arg0
	ld.w $a0, $fp, -20
	b max_exit
.max_label4:
# ret i32 %arg1
	ld.w $a0, $fp, -24
	b max_exit
max_exit:
	addi.d $sp, $sp, 32
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
	addi.d $sp, $sp, -192
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.knapsack_label_entry:
# %op2 = icmp sle i32 %arg1, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	xor $t3, $t0, $t1
	sltu $t3, $zero, $t3
	xori $t3, $t3, 1
	or $t2, $t3, $t2
	st.b $t2, $fp, -25
# br i1 %op2, label %label3, label %label4
	ld.b $a0, $fp, -25
	bnez $a0, .knapsack_label3
	b .knapsack_label4
.knapsack_label3:
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsack_exit
.knapsack_label4:
# br label %label5
	b .knapsack_label5
.knapsack_label5:
# %op6 = icmp eq i32 %arg0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t3, $zero, $t2
	xori $t2, $t3, 1
	st.b $t2, $fp, -26
# br i1 %op6, label %label7, label %label8
	ld.b $a0, $fp, -26
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
# %op10 = mul i32 %arg0, 11
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -30
# %op11 = add i32 %op10, %arg1
	ld.w $t0, $fp, -30
	ld.w $t1, $fp, -24
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -34
# %op12 = icmp slt i32 %op11, 0
	ld.w $t0, $fp, -34
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -35
# br i1 %op12, label %label13, label %label14
	ld.b $a0, $fp, -35
	bnez $a0, .knapsack_label13
	b .knapsack_label14
.knapsack_label13:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label14
	b .knapsack_label14
.knapsack_label14:
# %op15 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op11
	la.local $t0, dp
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -34
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -43
# %op16 = load i32, i32* %op15
	ld.d $t0, $fp, -43
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -47
# %op17 = icmp sge i32 %op16, 0
	ld.w $t0, $fp, -47
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	xor $t3, $t0, $t1
	sltu $t3, $zero, $t3
	xori $t3, $t3, 1
	or $t2, $t3, $t2
	st.b $t2, $fp, -48
# br i1 %op17, label %label18, label %label22
	ld.b $a0, $fp, -48
	bnez $a0, .knapsack_label18
	b .knapsack_label22
.knapsack_label18:
# %op19 = mul i32 %arg0, 11
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# %op20 = add i32 %op19, %arg1
	ld.w $t0, $fp, -52
	ld.w $t1, $fp, -24
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -56
# %op21 = icmp slt i32 %op20, 0
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -57
# br i1 %op21, label %label26, label %label27
	ld.b $a0, $fp, -57
	bnez $a0, .knapsack_label26
	b .knapsack_label27
.knapsack_label22:
# br label %label23
	b .knapsack_label23
.knapsack_label23:
# %op24 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -61
# %op25 = icmp slt i32 %op24, 0
	ld.w $t0, $fp, -61
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -62
# br i1 %op25, label %label30, label %label31
	ld.b $a0, $fp, -62
	bnez $a0, .knapsack_label30
	b .knapsack_label31
.knapsack_label26:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label27
	b .knapsack_label27
.knapsack_label27:
# %op28 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op20
	la.local $t0, dp
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -56
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -70
# %op29 = load i32, i32* %op28
	ld.d $t0, $fp, -70
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -74
# ret i32 %op29
	ld.w $a0, $fp, -74
	b knapsack_exit
.knapsack_label30:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label31
	b .knapsack_label31
.knapsack_label31:
# %op32 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op24
	la.local $t0, w
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -61
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -82
# %op33 = load i32, i32* %op32
	ld.d $t0, $fp, -82
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -86
# %op34 = icmp slt i32 %arg1, %op33
	ld.w $t0, $fp, -24
	ld.w $t1, $fp, -86
	slt $t2, $t0, $t1
	st.b $t2, $fp, -87
# br i1 %op34, label %label35, label %label38
	ld.b $a0, $fp, -87
	bnez $a0, .knapsack_label35
	b .knapsack_label38
.knapsack_label35:
# %op36 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -91
# %op37 = call i32 @knapsack(i32 %op36, i32 %arg1)
	ld.w $a0, $fp, -91
	ld.w $a1, $fp, -24
	bl knapsack
	st.w $a0, $fp, -95
# br label %label43
	ld.w $a0, $fp, -95
	st.w $a0, $fp, -112
	b .knapsack_label43
.knapsack_label38:
# %op39 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -99
# %op40 = call i32 @knapsack(i32 %op39, i32 %arg1)
	ld.w $a0, $fp, -99
	ld.w $a1, $fp, -24
	bl knapsack
	st.w $a0, $fp, -103
# %op41 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -107
# %op42 = icmp slt i32 %op41, 0
	ld.w $t0, $fp, -107
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -108
# br i1 %op42, label %label48, label %label49
	ld.b $a0, $fp, -108
	bnez $a0, .knapsack_label48
	b .knapsack_label49
.knapsack_label43:
# %op44 = phi i32 [ %op37, %label35 ], [ %op62, %label56 ]
# %op45 = mul i32 %arg0, 11
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# %op46 = add i32 %op45, %arg1
	ld.w $t0, $fp, -116
	ld.w $t1, $fp, -24
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -120
# %op47 = icmp slt i32 %op46, 0
	ld.w $t0, $fp, -120
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -121
# br i1 %op47, label %label63, label %label64
	ld.b $a0, $fp, -121
	bnez $a0, .knapsack_label63
	b .knapsack_label64
.knapsack_label48:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label49
	b .knapsack_label49
.knapsack_label49:
# %op50 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 %op41
	la.local $t0, v
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -107
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -129
# %op51 = load i32, i32* %op50
	ld.d $t0, $fp, -129
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -133
# %op52 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -137
# %op53 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -141
# %op54 = icmp slt i32 %op53, 0
	ld.w $t0, $fp, -141
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -142
# br i1 %op54, label %label55, label %label56
	ld.b $a0, $fp, -142
	bnez $a0, .knapsack_label55
	b .knapsack_label56
.knapsack_label55:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label56
	b .knapsack_label56
.knapsack_label56:
# %op57 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op53
	la.local $t0, w
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -141
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -150
# %op58 = load i32, i32* %op57
	ld.d $t0, $fp, -150
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -154
# %op59 = sub i32 %arg1, %op58
	ld.w $t0, $fp, -24
	ld.w $t1, $fp, -154
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -158
# %op60 = call i32 @knapsack(i32 %op52, i32 %op59)
	ld.w $a0, $fp, -137
	ld.w $a1, $fp, -158
	bl knapsack
	st.w $a0, $fp, -162
# %op61 = add i32 %op60, %op51
	ld.w $t0, $fp, -162
	ld.w $t1, $fp, -133
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -166
# %op62 = call i32 @max(i32 %op40, i32 %op61)
	ld.w $a0, $fp, -103
	ld.w $a1, $fp, -166
	bl max
	st.w $a0, $fp, -170
# br label %label43
	ld.w $a0, $fp, -170
	st.w $a0, $fp, -112
	b .knapsack_label43
.knapsack_label63:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label64
	b .knapsack_label64
.knapsack_label64:
# %op65 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op46
	la.local $t0, dp
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -120
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -178
# store i32 %op44, i32* %op65
	ld.d $t0, $fp, -178
	ld.w $t1, $fp, -112
	st.w $t1, $t0, 0
# ret i32 %op44
	ld.w $a0, $fp, -112
	b knapsack_exit
knapsack_exit:
	addi.d $sp, $sp, 192
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
	addi.d $sp, $sp, -160
.main_label_entry:
# store i32 5, i32* @n
	la.local $t0, n
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# store i32 10, i32* @m
	la.local $t0, m
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# %op0 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -17
# br i1 %op0, label %label1, label %label2
	ld.b $a0, $fp, -17
	bnez $a0, .main_label1
	b .main_label2
.main_label1:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label2
	b .main_label2
.main_label2:
# %op3 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 0
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 0
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -25
# store i32 2, i32* %op3
	ld.d $t0, $fp, -25
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op4 = icmp slt i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -26
# br i1 %op4, label %label5, label %label6
	ld.b $a0, $fp, -26
	bnez $a0, .main_label5
	b .main_label6
.main_label5:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label6
	b .main_label6
.main_label6:
# %op7 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 1
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 1
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -34
# store i32 2, i32* %op7
	ld.d $t0, $fp, -34
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op8 = icmp slt i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -35
# br i1 %op8, label %label9, label %label10
	ld.b $a0, $fp, -35
	bnez $a0, .main_label9
	b .main_label10
.main_label9:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label10
	b .main_label10
.main_label10:
# %op11 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 2
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 2
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -43
# store i32 6, i32* %op11
	ld.d $t0, $fp, -43
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op12 = icmp slt i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -44
# br i1 %op12, label %label13, label %label14
	ld.b $a0, $fp, -44
	bnez $a0, .main_label13
	b .main_label14
.main_label13:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label14
	b .main_label14
.main_label14:
# %op15 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 3
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 3
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -52
# store i32 5, i32* %op15
	ld.d $t0, $fp, -52
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op16 = icmp slt i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -53
# br i1 %op16, label %label17, label %label18
	ld.b $a0, $fp, -53
	bnez $a0, .main_label17
	b .main_label18
.main_label17:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label18
	b .main_label18
.main_label18:
# %op19 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 4
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -61
# store i32 4, i32* %op19
	ld.d $t0, $fp, -61
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op20 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -62
# br i1 %op20, label %label21, label %label22
	ld.b $a0, $fp, -62
	bnez $a0, .main_label21
	b .main_label22
.main_label21:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label22
	b .main_label22
.main_label22:
# %op23 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 0
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 0
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -70
# store i32 6, i32* %op23
	ld.d $t0, $fp, -70
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op24 = icmp slt i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -71
# br i1 %op24, label %label25, label %label26
	ld.b $a0, $fp, -71
	bnez $a0, .main_label25
	b .main_label26
.main_label25:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label26
	b .main_label26
.main_label26:
# %op27 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 1
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 1
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -79
# store i32 3, i32* %op27
	ld.d $t0, $fp, -79
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
# %op28 = icmp slt i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -80
# br i1 %op28, label %label29, label %label30
	ld.b $a0, $fp, -80
	bnez $a0, .main_label29
	b .main_label30
.main_label29:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label30
	b .main_label30
.main_label30:
# %op31 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 2
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 2
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -88
# store i32 5, i32* %op31
	ld.d $t0, $fp, -88
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op32 = icmp slt i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -89
# br i1 %op32, label %label33, label %label34
	ld.b $a0, $fp, -89
	bnez $a0, .main_label33
	b .main_label34
.main_label33:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label34
	b .main_label34
.main_label34:
# %op35 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 3
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 3
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -97
# store i32 4, i32* %op35
	ld.d $t0, $fp, -97
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op36 = icmp slt i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -98
# br i1 %op36, label %label37, label %label38
	ld.b $a0, $fp, -98
	bnez $a0, .main_label37
	b .main_label38
.main_label37:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label38
	b .main_label38
.main_label38:
# %op39 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 4
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -106
# store i32 6, i32* %op39
	ld.d $t0, $fp, -106
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# br label %label40
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -110
	b .main_label40
.main_label40:
# %op41 = phi i32 [ 0, %label38 ], [ %op55, %label52 ]
# %op42 = icmp slt i32 %op41, 66
	ld.w $t0, $fp, -110
	addi.w $t1, $zero, 66
	slt $t2, $t0, $t1
	st.b $t2, $fp, -111
# %op43 = zext i1 %op42 to i32
	ld.b $t0, $fp, -111
	st.w $t0, $fp, -115
# %op44 = icmp ne i32 %op43, 0
	ld.w $t0, $fp, -115
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -116
# br i1 %op44, label %label45, label %label47
	ld.b $a0, $fp, -116
	bnez $a0, .main_label45
	b .main_label47
.main_label45:
# %op46 = icmp slt i32 %op41, 0
	ld.w $t0, $fp, -110
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -117
# br i1 %op46, label %label51, label %label52
	ld.b $a0, $fp, -117
	bnez $a0, .main_label51
	b .main_label52
.main_label47:
# %op48 = load i32, i32* @n
	la.local $t0, n
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -121
# %op49 = load i32, i32* @m
	la.local $t0, m
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -125
# %op50 = call i32 @knapsack(i32 %op48, i32 %op49)
	ld.w $a0, $fp, -121
	ld.w $a1, $fp, -125
	bl knapsack
	st.w $a0, $fp, -129
# call void @output(i32 %op50)
	ld.w $a0, $fp, -129
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
.main_label51:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label52
	b .main_label52
.main_label52:
# %op53 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op41
	la.local $t0, dp
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -110
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -137
# %op54 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -141
# store i32 %op54, i32* %op53
	ld.d $t0, $fp, -137
	ld.w $t1, $fp, -141
	st.w $t1, $t0, 0
# %op55 = add i32 %op41, 1
	ld.w $t0, $fp, -110
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -145
# br label %label40
	ld.w $a0, $fp, -145
	st.w $a0, $fp, -110
	b .main_label40
main_exit:
	addi.d $sp, $sp, 160
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
