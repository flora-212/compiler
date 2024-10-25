; ModuleID = 'cminus'
source_filename = "/home/flora/2024ustc-jianmu-compiler/tests/2-ir-gen/autogen/testcases/lv1/assign_int_var_global.cminus"

@a = global i32 0
declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @main() {
label_entry:
  %op0 = load i32, i32* @a
  store i32 1234, i32* @a
  %op1 = load i32, i32* @a
  call void @output(i32 %op1)
  ret void
}
