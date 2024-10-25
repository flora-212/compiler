; ModuleID = 'cminus'
source_filename = "/home/flora/2024ustc-jianmu-compiler/tests/2-ir-gen/autogen/testcases/lv1/assign_int_array_local.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @main() {
label_entry:
  %op0 = alloca [10 x i32]
  %op1 = icmp slt i32 3, 0
  br i1 %op1, label %label_neg_bb, label %label_nonneg_bb
label_neg_bb:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_nonneg_bb
label_nonneg_bb:                                                ; preds = %label_entry, %label_neg_bb
  %op2 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 3
  %op3 = load i32, i32* %op2
  store i32 1234, i32* %op2
  %op4 = icmp slt i32 3, 0
  br i1 %op4, label %label_neg_bb, label %label_nonneg_bb
label_neg_bb:                                                ; preds = %label_nonneg_bb
  call void @neg_idx_except()
  br label %label_nonneg_bb
label_nonneg_bb:                                                ; preds = %label_nonneg_bb, %label_neg_bb
  %op5 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 3
  %op6 = load i32, i32* %op5
  call void @output(i32 %op6)
  ret void
}
