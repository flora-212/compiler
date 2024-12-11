	.text
	.globl store
	.type store, @function
store:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.d $a0, $fp, -24
	st.w $a1, $fp, -28
	st.w $a2, $fp, -32
.store_label_entry:
# %op3 = icmp slt i32 %arg1, 0
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -33
# br i1 %op3, label %label4, label %label5
	ld.b $a0, $fp, -33
	bnez $a0, .store_label4
	b .store_label5
.store_label4:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label5
	b .store_label5
.store_label5:
# %op6 = getelementptr i32, i32* %arg0, i32 %arg1
	ld.d $t0, $fp, -24
	st.d $t0, $fp, -41
	ld.w $t1, $fp, -28
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -41
# store i32 %arg2, i32* %op6
	ld.d $t0, $fp, -41
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
# ret i32 %arg2
	ld.w $a0, $fp, -32
	b store_exit
store_exit:
	addi.d $sp, $sp, 48
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
	addi.d $sp, $sp, -144
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t0, $fp, -24
	addi.d $t1, $t0,-40
	st.d $t1, $fp, -24
# br label %label1
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -68
	b .main_label1
.main_label1:
# %op2 = phi i32 [ 0, %label_entry ], [ %op10, %label6 ]
# %op3 = icmp slt i32 %op2, 10
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	st.b $t2, $fp, -69
# %op4 = zext i1 %op3 to i32
	ld.b $t0, $fp, -69
	st.w $t0, $fp, -73
# %op5 = icmp ne i32 %op4, 0
	ld.w $t0, $fp, -73
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -74
# br i1 %op5, label %label6, label %label11
	ld.b $a0, $fp, -74
	bnez $a0, .main_label6
	b .main_label11
.main_label6:
# %op7 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 0
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -82
# %op8 = mul i32 %op2, 2
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -86
# %op9 = call i32 @store(i32* %op7, i32 %op2, i32 %op8)
	ld.d $a0, $fp, -82
	ld.w $a1, $fp, -68
	ld.w $a2, $fp, -86
	bl store
	st.w $a0, $fp, -90
# %op10 = add i32 %op2, 1
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -94
# br label %label1
	ld.w $a0, $fp, -94
	st.w $a0, $fp, -68
	b .main_label1
.main_label11:
# br label %label12
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -98
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -102
	b .main_label12
.main_label12:
# %op13 = phi i32 [ 0, %label11 ], [ %op25, %label22 ]
# %op14 = phi i32 [ 0, %label11 ], [ %op26, %label22 ]
# %op15 = icmp slt i32 %op14, 10
	ld.w $t0, $fp, -102
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	st.b $t2, $fp, -103
# %op16 = zext i1 %op15 to i32
	ld.b $t0, $fp, -103
	st.w $t0, $fp, -107
# %op17 = icmp ne i32 %op16, 0
	ld.w $t0, $fp, -107
	addi.w $t1, $zero, 0
	xor $t2, $t0, $t1
	sltu $t2, $zero, $t2
	st.b $t2, $fp, -108
# br i1 %op17, label %label18, label %label20
	ld.b $a0, $fp, -108
	bnez $a0, .main_label18
	b .main_label20
.main_label18:
# %op19 = icmp slt i32 %op14, 0
	ld.w $t0, $fp, -102
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -109
# br i1 %op19, label %label21, label %label22
	ld.b $a0, $fp, -109
	bnez $a0, .main_label21
	b .main_label22
.main_label20:
# call void @output(i32 %op13)
	ld.w $a0, $fp, -98
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
.main_label21:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label22
	b .main_label22
.main_label22:
# %op23 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 %op14
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -102
	sub.d $t1, $t2, $t1
	addi.d $t2, $zero, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t3, $t0
	st.d $t4, $fp, -117
# %op24 = load i32, i32* %op23
	ld.d $t0, $fp, -117
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -121
# %op25 = add i32 %op13, %op24
	ld.w $t0, $fp, -98
	ld.w $t1, $fp, -121
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -125
# %op26 = add i32 %op14, 1
	ld.w $t0, $fp, -102
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -129
# br label %label12
	ld.w $a0, $fp, -125
	st.w $a0, $fp, -98
	ld.w $a0, $fp, -129
	st.w $a0, $fp, -102
	b .main_label12
main_exit:
	addi.d $sp, $sp, 144
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
