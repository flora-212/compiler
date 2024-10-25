; ModuleID = 'cminus'
source_filename = "/home/flora/2024ustc-jianmu-compiler/tests/2-ir-gen/autogen/testcases/lv1/selection2.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @main() {
label_entry:
  %op0 = icmp sgt i32 2, 1
  br i1 %op0, label %label_if_bb, label %label_else_bb
label_if_bb:                                                ; preds = %label_entry
  call void @output(i32 42)
  br label %label_ret_bb
label_else_bb:                                                ; preds = %label_entry
  br label %label_ret_bb
label_ret_bb:                                                ; preds = %label_if_bb, %label_else_bb
  call void @output(i32 24)
  %op1 = icmp sgt i32 1, 2
  br i1 %op1, label %label_if_bb, label %label_else_bb
label_if_bb:                                                ; preds = %label_ret_bb
  call void @output(i32 1234)
  br label %label_ret_bb
label_else_bb:                                                ; preds = %label_ret_bb
  br label %label_ret_bb
label_ret_bb:                                                ; preds = %label_if_bb, %label_else_bb
  ret void
}
