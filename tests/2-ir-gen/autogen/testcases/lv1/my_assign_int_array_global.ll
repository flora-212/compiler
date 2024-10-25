; ModuleID = 'cminus'
source_filename = "/home/flora/2024ustc-jianmu-compiler/tests/2-ir-gen/autogen/testcases/lv1/assign_int_array_global.cminus"

@a = global [10 x i32] zeroinitializer
declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @main() {
label_entry:
  %op0 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 3
  %op1 = load i32, i32* %op0
  store i32 1234, i32* %op0
  %op2 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 3
  %op3 = load i32, i32* %op2
  call void @output(i32 %op3)
  ret void
}
