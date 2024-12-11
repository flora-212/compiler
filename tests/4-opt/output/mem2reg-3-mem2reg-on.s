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
	addi.d $sp, $sp, -48
.readarray_label_entry:
# br label %label0
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -20
	b .readarray_label0
.readarray_label0:
# %op1 = phi i32 [ 0, %label_entry ], [ %op13, %label10 ]
# %op2 = load i32, i32* @len
	la.local $t0, len
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -24
# %op3 = icmp slt i32 %op1, %op2
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -24
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
# br i1 %op5, label %label6, label %label8
	ld.b $a0, $fp, -30
	bnez $a0, .readarray_label6
	b .readarray_label8
.readarray_label6:
# %op7 = icmp slt i32 %op1, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -31
# br i1 %op7, label %label9, label %label10
	ld.b $a0, $fp, -31
	bnez $a0, .readarray_label9
	b .readarray_label10
.readarray_label8:
# ret void
	add.w $a0, $zero, $zero
	b readarray_exit
.readarray_label9:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label10
	b .readarray_label10
.readarray_label10:
# %op11 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op1
	la.local $t0, ad
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -20
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -39
# %op12 = call i32 @input()
	bl input
	st.w $a0, $fp, -43
# store i32 %op12, i32* %op11
	ld.d $t0, $fp, -39
	ld.w $t1, $fp, -43
	st.w $t1, $t0, 0
# %op13 = add i32 %op1, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -47
# br label %label0
	ld.w $a0, $fp, -47
	st.w $a0, $fp, -20
	b .readarray_label0
readarray_exit:
	addi.d $sp, $sp, 48
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
	.globl transpose
	.type transpose, @function
transpose:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -160
	st.w $a0, $fp, -20
	st.d $a1, $fp, -28
	st.w $a2, $fp, -32
.transpose_label_entry:
# %op3 = sdiv i32 %arg0, %arg2
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -32
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -36
# br label %label4
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -40
	b .transpose_label4
.transpose_label4:
# %op5 = phi i32 [ 0, %label_entry ], [ %op20, %label19 ]
# %op6 = icmp slt i32 %op5, %op3
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -36
	slt $t2, $t0, $t1
	st.b $t2, $fp, -41
# %op7 = zext i1 %op6 to i32
	ld.b $t0, $fp, -41
	st.w $t0, $fp, -45
# %op8 = icmp ne i32 %op7, 0
	ld.w $t0, $fp, -45
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -46
# br i1 %op8, label %label9, label %label10
	ld.b $a0, $fp, -46
	bnez $a0, .transpose_label9
	b .transpose_label10
.transpose_label9:
# br label %label12
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -54
	b .transpose_label12
.transpose_label10:
# %op11 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -50
# ret i32 %op11
	ld.w $a0, $fp, -50
	b transpose_exit
.transpose_label12:
# %op13 = phi i32 [ 0, %label9 ], [ %op28, %label27 ]
# %op14 = icmp slt i32 %op13, %arg2
	ld.w $t0, $fp, -54
	ld.w $t1, $fp, -32
	slt $t2, $t0, $t1
	st.b $t2, $fp, -55
# %op15 = zext i1 %op14 to i32
	ld.b $t0, $fp, -55
	st.w $t0, $fp, -59
# %op16 = icmp ne i32 %op15, 0
	ld.w $t0, $fp, -59
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -60
# br i1 %op16, label %label17, label %label19
	ld.b $a0, $fp, -60
	bnez $a0, .transpose_label17
	b .transpose_label19
.transpose_label17:
# %op18 = icmp slt i32 %op5, %op13
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -54
	slt $t2, $t0, $t1
	st.b $t2, $fp, -61
# br i1 %op18, label %label21, label %label23
	ld.b $a0, $fp, -61
	bnez $a0, .transpose_label21
	b .transpose_label23
.transpose_label19:
# %op20 = add i32 %op5, 1
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -65
# br label %label4
	ld.w $a0, $fp, -65
	st.w $a0, $fp, -40
	b .transpose_label4
.transpose_label21:
# %op22 = add i32 %op13, 1
	ld.w $t0, $fp, -54
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -69
# br label %label27
	ld.w $a0, $fp, -69
	st.w $a0, $fp, -82
	b .transpose_label27
.transpose_label23:
# %op24 = mul i32 %op5, %arg2
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -32
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -73
# %op25 = add i32 %op24, %op13
	ld.w $t0, $fp, -73
	ld.w $t1, $fp, -54
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -77
# %op26 = icmp slt i32 %op25, 0
	ld.w $t0, $fp, -77
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -78
# br i1 %op26, label %label29, label %label30
	ld.b $a0, $fp, -78
	bnez $a0, .transpose_label29
	b .transpose_label30
.transpose_label27:
# %op28 = phi i32 [ %op22, %label21 ], [ %op52, %label50 ]
# br label %label12
	ld.w $a0, $fp, -82
	st.w $a0, $fp, -54
	b .transpose_label12
.transpose_label29:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label30
	b .transpose_label30
.transpose_label30:
# %op31 = getelementptr i32, i32* %arg1, i32 %op25
	ld.d $t0, $fp, -28
	st.d $t0, $fp, -90
	ld.w $t1, $fp, -77
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -90
# %op32 = load i32, i32* %op31
	ld.d $t0, $fp, -90
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -94
# %op33 = mul i32 %op13, %op3
	ld.w $t0, $fp, -54
	ld.w $t1, $fp, -36
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -98
# %op34 = add i32 %op33, %op5
	ld.w $t0, $fp, -98
	ld.w $t1, $fp, -40
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -102
# %op35 = icmp slt i32 %op34, 0
	ld.w $t0, $fp, -102
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -103
# br i1 %op35, label %label36, label %label37
	ld.b $a0, $fp, -103
	bnez $a0, .transpose_label36
	b .transpose_label37
.transpose_label36:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label37
	b .transpose_label37
.transpose_label37:
# %op38 = getelementptr i32, i32* %arg1, i32 %op34
	ld.d $t0, $fp, -28
	st.d $t0, $fp, -111
	ld.w $t1, $fp, -102
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -111
# %op39 = mul i32 %op5, %arg2
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -32
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -115
# %op40 = add i32 %op39, %op13
	ld.w $t0, $fp, -115
	ld.w $t1, $fp, -54
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -119
# %op41 = icmp slt i32 %op40, 0
	ld.w $t0, $fp, -119
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -120
# br i1 %op41, label %label42, label %label43
	ld.b $a0, $fp, -120
	bnez $a0, .transpose_label42
	b .transpose_label43
.transpose_label42:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label43
	b .transpose_label43
.transpose_label43:
# %op44 = getelementptr i32, i32* %arg1, i32 %op40
	ld.d $t0, $fp, -28
	st.d $t0, $fp, -128
	ld.w $t1, $fp, -119
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -128
# %op45 = load i32, i32* %op44
	ld.d $t0, $fp, -128
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -132
# store i32 %op45, i32* %op38
	ld.d $t0, $fp, -111
	ld.w $t1, $fp, -132
	st.w $t1, $t0, 0
# %op46 = mul i32 %op5, %arg2
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -32
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -136
# %op47 = add i32 %op46, %op13
	ld.w $t0, $fp, -136
	ld.w $t1, $fp, -54
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -140
# %op48 = icmp slt i32 %op47, 0
	ld.w $t0, $fp, -140
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -141
# br i1 %op48, label %label49, label %label50
	ld.b $a0, $fp, -141
	bnez $a0, .transpose_label49
	b .transpose_label50
.transpose_label49:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label50
	b .transpose_label50
.transpose_label50:
# %op51 = getelementptr i32, i32* %arg1, i32 %op47
	ld.d $t0, $fp, -28
	st.d $t0, $fp, -149
	ld.w $t1, $fp, -140
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -149
# store i32 %op32, i32* %op51
	ld.d $t0, $fp, -149
	ld.w $t1, $fp, -94
	st.w $t1, $t0, 0
# %op52 = add i32 %op13, 1
	ld.w $t0, $fp, -54
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -153
# br label %label27
	ld.w $a0, $fp, -153
	st.w $a0, $fp, -82
	b .transpose_label27
transpose_exit:
	addi.d $sp, $sp, 160
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
	addi.d $sp, $sp, -160
.main_label_entry:
# %op0 = call i32 @input()
	bl input
	st.w $a0, $fp, -20
# %op1 = call i32 @input()
	bl input
	st.w $a0, $fp, -24
# store i32 %op1, i32* @len
	la.local $t0, len
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
# call void @readarray()
	bl readarray
# br label %label2
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -28
	b .main_label2
.main_label2:
# %op3 = phi i32 [ 0, %label_entry ], [ %op13, %label11 ]
# %op4 = icmp slt i32 %op3, %op0
	ld.w $t0, $fp, -28
	ld.w $t1, $fp, -20
	slt $t2, $t0, $t1
	st.b $t2, $fp, -29
# %op5 = zext i1 %op4 to i32
	ld.b $t0, $fp, -29
	st.w $t0, $fp, -33
# %op6 = icmp ne i32 %op5, 0
	ld.w $t0, $fp, -33
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -34
# br i1 %op6, label %label7, label %label9
	ld.b $a0, $fp, -34
	bnez $a0, .main_label7
	b .main_label9
.main_label7:
# %op8 = icmp slt i32 %op3, 0
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -35
# br i1 %op8, label %label10, label %label11
	ld.b $a0, $fp, -35
	bnez $a0, .main_label10
	b .main_label11
.main_label9:
# br label %label14
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -51
	b .main_label14
.main_label10:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label11
	b .main_label11
.main_label11:
# %op12 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op3
	la.local $t0, matrix
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -28
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -43
# store i32 %op3, i32* %op12
	ld.d $t0, $fp, -43
	ld.w $t1, $fp, -28
	st.w $t1, $t0, 0
# %op13 = add i32 %op3, 1
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -47
# br label %label2
	ld.w $a0, $fp, -47
	st.w $a0, $fp, -28
	b .main_label2
.main_label14:
# %op15 = phi i32 [ 0, %label9 ], [ %op29, %label25 ]
# %op16 = load i32, i32* @len
	la.local $t0, len
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -55
# %op17 = icmp slt i32 %op15, %op16
	ld.w $t0, $fp, -51
	ld.w $t1, $fp, -55
	slt $t2, $t0, $t1
	st.b $t2, $fp, -56
# %op18 = zext i1 %op17 to i32
	ld.b $t0, $fp, -56
	st.w $t0, $fp, -60
# %op19 = icmp ne i32 %op18, 0
	ld.w $t0, $fp, -60
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -61
# br i1 %op19, label %label20, label %label23
	ld.b $a0, $fp, -61
	bnez $a0, .main_label20
	b .main_label23
.main_label20:
# %op21 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 0
	la.local $t0, matrix
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 0
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -69
# %op22 = icmp slt i32 %op15, 0
	ld.w $t0, $fp, -51
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -70
# br i1 %op22, label %label24, label %label25
	ld.b $a0, $fp, -70
	bnez $a0, .main_label24
	b .main_label25
.main_label23:
# br label %label30
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -94
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -98
	b .main_label30
.main_label24:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label25
	b .main_label25
.main_label25:
# %op26 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op15
	la.local $t0, ad
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -51
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -78
# %op27 = load i32, i32* %op26
	ld.d $t0, $fp, -78
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -82
# %op28 = call i32 @transpose(i32 %op0, i32* %op21, i32 %op27)
	ld.w $a0, $fp, -20
	ld.d $a1, $fp, -69
	ld.w $a2, $fp, -82
	bl transpose
	st.w $a0, $fp, -86
# %op29 = add i32 %op15, 1
	ld.w $t0, $fp, -51
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -90
# br label %label14
	ld.w $a0, $fp, -90
	st.w $a0, $fp, -51
	b .main_label14
.main_label30:
# %op31 = phi i32 [ 0, %label23 ], [ %op47, %label42 ]
# %op32 = phi i32 [ 0, %label23 ], [ %op48, %label42 ]
# %op33 = load i32, i32* @len
	la.local $t0, len
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -102
# %op34 = icmp slt i32 %op32, %op33
	ld.w $t0, $fp, -98
	ld.w $t1, $fp, -102
	slt $t2, $t0, $t1
	st.b $t2, $fp, -103
# %op35 = zext i1 %op34 to i32
	ld.b $t0, $fp, -103
	st.w $t0, $fp, -107
# %op36 = icmp ne i32 %op35, 0
	ld.w $t0, $fp, -107
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -108
# br i1 %op36, label %label37, label %label39
	ld.b $a0, $fp, -108
	bnez $a0, .main_label37
	b .main_label39
.main_label37:
# %op38 = icmp slt i32 %op32, 0
	ld.w $t0, $fp, -98
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -109
# br i1 %op38, label %label41, label %label42
	ld.b $a0, $fp, -109
	bnez $a0, .main_label41
	b .main_label42
.main_label39:
# %op40 = icmp slt i32 %op31, 0
	ld.w $t0, $fp, -94
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -110
# br i1 %op40, label %label49, label %label51
	ld.b $a0, $fp, -110
	bnez $a0, .main_label49
	b .main_label51
.main_label41:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label42
	b .main_label42
.main_label42:
# %op43 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op32
	la.local $t0, matrix
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -98
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -118
# %op44 = load i32, i32* %op43
	ld.d $t0, $fp, -118
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -122
# %op45 = mul i32 %op32, %op32
	ld.w $t0, $fp, -98
	ld.w $t1, $fp, -98
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -126
# %op46 = mul i32 %op45, %op44
	ld.w $t0, $fp, -126
	ld.w $t1, $fp, -122
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -130
# %op47 = add i32 %op31, %op46
	ld.w $t0, $fp, -94
	ld.w $t1, $fp, -130
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -134
# %op48 = add i32 %op32, 1
	ld.w $t0, $fp, -98
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -138
# br label %label30
	ld.w $a0, $fp, -134
	st.w $a0, $fp, -94
	ld.w $a0, $fp, -138
	st.w $a0, $fp, -98
	b .main_label30
.main_label49:
# %op50 = sub i32 0, %op31
	addi.w $t0, $zero, 0
	ld.w $t1, $fp, -94
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -142
# br label %label52
	ld.w $a0, $fp, -142
	st.w $a0, $fp, -146
	b .main_label52
.main_label51:
# br label %label52
	ld.w $a0, $fp, -94
	st.w $a0, $fp, -146
	b .main_label52
.main_label52:
# %op53 = phi i32 [ %op50, %label49 ], [ %op31, %label51 ]
# call void @output(i32 %op53)
	ld.w $a0, $fp, -146
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
main_exit:
	addi.d $sp, $sp, 160
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
