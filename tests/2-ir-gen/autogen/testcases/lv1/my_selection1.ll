; ModuleID = 'cminus'
source_filename = "/home/flora/2024ustc-jianmu-compiler/tests/2-ir-gen/autogen/testcases/lv1/selection1.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @main() {
label_entry:
  %op0 = alloca i32
  %op1 = load i32, i32* %op0
  store i32 2, i32* %op0
  %op2 = load i32, i32* %op0
  %op3 = icmp ne i32 %op2, 0
  br i1 %op3, label %label_if_bb, label %label_else_bb
label_if_bb:                                                ; preds = %label_entry
  call void @output(i32 42)
  br label %label_ret_bb
label_else_bb:                                                ; preds = %label_entry
  br label %label_ret_bb
label_ret_bb:                                                ; preds = %label_if_bb, %label_else_bb
  call void @output(i32 24)
  ret void
}
