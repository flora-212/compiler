; ModuleID = 'cminus'
source_filename = "/home/flora/2024ustc-jianmu-compiler/tests/2-ir-gen/autogen/testcases/lv3/complex1.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @mod(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = alloca i32
  store i32 %arg0, i32* %op2
  %op3 = alloca i32
  store i32 %arg1, i32* %op3
  %op4 = load i32, i32* %op3
  %op5 = load i32, i32* %op3
  %op6 = load i32, i32* %op2
  %op7 = sdiv i32 %op6, %op5
  %op8 = mul i32 %op7, %op4
  %op9 = load i32, i32* %op2
  %op10 = sub i32 %op9, %op8
  ret i32 %op10
}
define void @printfour(i32 %arg0) {
label_entry:
  %op1 = alloca i32
  store i32 %arg0, i32* %op1
  %op2 = alloca i32
  %op3 = alloca i32
  %op4 = alloca i32
  %op5 = alloca i32
  %op6 = load i32, i32* %op1
  %op7 = call i32 @mod(i32 %op6, i32 10000)
  store i32 %op7, i32* %op1
  %op8 = load i32, i32* %op1
  %op9 = call i32 @mod(i32 %op8, i32 10)
  store i32 %op9, i32* %op5
  %op10 = load i32, i32* %op1
  %op11 = sdiv i32 %op10, 10
  store i32 %op11, i32* %op1
  %op12 = load i32, i32* %op1
  %op13 = call i32 @mod(i32 %op12, i32 10)
  store i32 %op13, i32* %op4
  %op14 = load i32, i32* %op1
  %op15 = sdiv i32 %op14, 10
  store i32 %op15, i32* %op1
  %op16 = load i32, i32* %op1
  %op17 = call i32 @mod(i32 %op16, i32 10)
  store i32 %op17, i32* %op3
  %op18 = load i32, i32* %op1
  %op19 = sdiv i32 %op18, 10
  store i32 %op19, i32* %op1
  %op20 = load i32, i32* %op1
  store i32 %op20, i32* %op2
  %op21 = load i32, i32* %op2
  call void @output(i32 %op21)
  %op22 = load i32, i32* %op3
  call void @output(i32 %op22)
  %op23 = load i32, i32* %op4
  call void @output(i32 %op23)
  %op24 = load i32, i32* %op5
  call void @output(i32 %op24)
  ret void
}
define void @main() {
label_entry:
  %op0 = alloca [2801 x i32]
  %op1 = alloca i32
  %op2 = alloca i32
  %op3 = alloca i32
  %op4 = alloca i32
  %op5 = alloca i32
  store i32 0, i32* %op5
  store i32 1234, i32* %op4
  %op6 = alloca i32
  store i32 0, i32* %op6
  br label %label7
label7:                                                ; preds = %label_entry, %label17
  %op8 = load i32, i32* %op6
  %op9 = icmp slt i32 %op8, 2800
  %op10 = zext i1 %op9 to i32
  %op11 = icmp ne i32 %op10, 0
  br i1 %op11, label %label12, label %label15
label12:                                                ; preds = %label7
  %op13 = load i32, i32* %op6
  %op14 = icmp slt i32 %op13, 0
  br i1 %op14, label %label16, label %label17
label15:                                                ; preds = %label7
  store i32 2800, i32* %op2
  br label %label21
label16:                                                ; preds = %label12
  call void @neg_idx_except()
  br label %label17
label17:                                                ; preds = %label12, %label16
  %op18 = getelementptr [2801 x i32], [2801 x i32]* %op0, i32 0, i32 %op13
  store i32 2000, i32* %op18
  %op19 = load i32, i32* %op6
  %op20 = add i32 %op19, 1
  store i32 %op20, i32* %op6
  br label %label7
label21:                                                ; preds = %label15, %label36
  %op22 = load i32, i32* %op2
  %op23 = icmp ne i32 %op22, 0
  br i1 %op23, label %label24, label %label27
label24:                                                ; preds = %label21
  %op25 = alloca i32
  store i32 0, i32* %op25
  %op26 = load i32, i32* %op2
  store i32 %op26, i32* %op1
  br label %label28
label27:                                                ; preds = %label21
  ret void
label28:                                                ; preds = %label24, %label75
  %op29 = load i32, i32* %op1
  %op30 = icmp ne i32 %op29, 0
  %op31 = zext i1 %op30 to i32
  %op32 = icmp ne i32 %op31, 0
  br i1 %op32, label %label33, label %label36
label33:                                                ; preds = %label28
  %op34 = load i32, i32* %op1
  %op35 = icmp slt i32 %op34, 0
  br i1 %op35, label %label45, label %label46
label36:                                                ; preds = %label28
  %op37 = load i32, i32* %op25
  %op38 = sdiv i32 %op37, 10000
  %op39 = load i32, i32* %op5
  %op40 = add i32 %op39, %op38
  call void @printfour(i32 %op40)
  %op41 = load i32, i32* %op25
  %op42 = call i32 @mod(i32 %op41, i32 10000)
  store i32 %op42, i32* %op5
  %op43 = load i32, i32* %op2
  %op44 = sub i32 %op43, 14
  store i32 %op44, i32* %op2
  br label %label21
label45:                                                ; preds = %label33
  call void @neg_idx_except()
  br label %label46
label46:                                                ; preds = %label33, %label45
  %op47 = getelementptr [2801 x i32], [2801 x i32]* %op0, i32 0, i32 %op34
  %op48 = load i32, i32* %op47
  %op49 = mul i32 %op48, 10000
  %op50 = load i32, i32* %op25
  %op51 = add i32 %op50, %op49
  store i32 %op51, i32* %op25
  %op52 = load i32, i32* %op1
  %op53 = mul i32 2, %op52
  %op54 = sub i32 %op53, 1
  store i32 %op54, i32* %op3
  %op55 = load i32, i32* %op1
  %op56 = icmp slt i32 %op55, 0
  br i1 %op56, label %label57, label %label58
label57:                                                ; preds = %label46
  call void @neg_idx_except()
  br label %label58
label58:                                                ; preds = %label46, %label57
  %op59 = getelementptr [2801 x i32], [2801 x i32]* %op0, i32 0, i32 %op55
  %op60 = load i32, i32* %op25
  %op61 = load i32, i32* %op3
  %op62 = call i32 @mod(i32 %op60, i32 %op61)
  store i32 %op62, i32* %op59
  %op63 = load i32, i32* %op3
  %op64 = load i32, i32* %op25
  %op65 = sdiv i32 %op64, %op63
  store i32 %op65, i32* %op25
  %op66 = load i32, i32* %op1
  %op67 = sub i32 %op66, 1
  store i32 %op67, i32* %op1
  %op68 = load i32, i32* %op1
  %op69 = icmp ne i32 %op68, 0
  br i1 %op69, label %label70, label %label74
label70:                                                ; preds = %label58
  %op71 = load i32, i32* %op1
  %op72 = load i32, i32* %op25
  %op73 = mul i32 %op72, %op71
  store i32 %op73, i32* %op25
  br label %label75
label74:                                                ; preds = %label58
  br label %label75
label75:                                                ; preds = %label70, %label74
  br label %label28
}
