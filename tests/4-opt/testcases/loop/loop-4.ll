; ModuleID = 'cminus'
source_filename = "/home/flora/2024ustc-jianmu-compiler/tests/4-opt/testcases/loop/loop-4.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @main() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca i32
  %op2 = alloca i32
  %op3 = alloca i32
  %op4 = alloca i32
  %op5 = alloca i32
  %op6 = alloca i32
  %op7 = alloca i32
  store i32 2, i32* %op6
  store i32 0, i32* %op0
  br label %label8
label8:                                                ; preds = %label_entry, %label22
  %op9 = load i32, i32* %op0
  %op10 = icmp slt i32 %op9, 1000000
  %op11 = zext i1 %op10 to i32
  %op12 = icmp ne i32 %op11, 0
  br i1 %op12, label %label13, label %label14
label13:                                                ; preds = %label8
  store i32 0, i32* %op1
  br label %label16
label14:                                                ; preds = %label8
  %op15 = load i32, i32* %op7
  call void @output(i32 %op15)
  ret void
label16:                                                ; preds = %label13, %label31
  %op17 = load i32, i32* %op1
  %op18 = icmp slt i32 %op17, 2
  %op19 = zext i1 %op18 to i32
  %op20 = icmp ne i32 %op19, 0
  br i1 %op20, label %label21, label %label22
label21:                                                ; preds = %label16
  store i32 0, i32* %op2
  br label %label25
label22:                                                ; preds = %label16
  %op23 = load i32, i32* %op0
  %op24 = add i32 %op23, 1
  store i32 %op24, i32* %op0
  br label %label8
label25:                                                ; preds = %label21, %label40
  %op26 = load i32, i32* %op2
  %op27 = icmp slt i32 %op26, 2
  %op28 = zext i1 %op27 to i32
  %op29 = icmp ne i32 %op28, 0
  br i1 %op29, label %label30, label %label31
label30:                                                ; preds = %label25
  store i32 0, i32* %op3
  br label %label34
label31:                                                ; preds = %label25
  %op32 = load i32, i32* %op1
  %op33 = add i32 %op32, 1
  store i32 %op33, i32* %op1
  br label %label16
label34:                                                ; preds = %label30, %label49
  %op35 = load i32, i32* %op3
  %op36 = icmp slt i32 %op35, 2
  %op37 = zext i1 %op36 to i32
  %op38 = icmp ne i32 %op37, 0
  br i1 %op38, label %label39, label %label40
label39:                                                ; preds = %label34
  store i32 0, i32* %op4
  br label %label43
label40:                                                ; preds = %label34
  %op41 = load i32, i32* %op2
  %op42 = add i32 %op41, 1
  store i32 %op42, i32* %op2
  br label %label25
label43:                                                ; preds = %label39, %label60
  %op44 = load i32, i32* %op4
  %op45 = icmp slt i32 %op44, 2
  %op46 = zext i1 %op45 to i32
  %op47 = icmp ne i32 %op46, 0
  br i1 %op47, label %label48, label %label49
label48:                                                ; preds = %label43
  store i32 0, i32* %op5
  br label %label52
label49:                                                ; preds = %label43
  %op50 = load i32, i32* %op3
  %op51 = add i32 %op50, 1
  store i32 %op51, i32* %op3
  br label %label34
label52:                                                ; preds = %label48, %label67
  %op53 = load i32, i32* %op5
  %op54 = icmp slt i32 %op53, 2
  %op55 = zext i1 %op54 to i32
  %op56 = icmp ne i32 %op55, 0
  br i1 %op56, label %label57, label %label60
label57:                                                ; preds = %label52
  %op58 = load i32, i32* %op6
  %op59 = icmp sgt i32 %op58, 1
  br i1 %op59, label %label63, label %label66
label60:                                                ; preds = %label52
  %op61 = load i32, i32* %op4
  %op62 = add i32 %op61, 1
  store i32 %op62, i32* %op4
  br label %label43
label63:                                                ; preds = %label57
  %op64 = load i32, i32* %op1
  %op65 = add i32 %op64, 1
  store i32 %op65, i32* %op1
  br label %label67
label66:                                                ; preds = %label57
  br label %label67
label67:                                                ; preds = %label63, %label66
  %op68 = load i32, i32* %op6
  %op69 = load i32, i32* %op6
  %op70 = load i32, i32* %op6
  %op71 = load i32, i32* %op6
  %op72 = load i32, i32* %op6
  %op73 = load i32, i32* %op6
  %op74 = load i32, i32* %op6
  %op75 = load i32, i32* %op6
  %op76 = load i32, i32* %op6
  %op77 = load i32, i32* %op6
  %op78 = load i32, i32* %op6
  %op79 = load i32, i32* %op6
  %op80 = load i32, i32* %op6
  %op81 = load i32, i32* %op6
  %op82 = load i32, i32* %op6
  %op83 = load i32, i32* %op6
  %op84 = load i32, i32* %op6
  %op85 = load i32, i32* %op6
  %op86 = load i32, i32* %op6
  %op87 = load i32, i32* %op6
  %op88 = mul i32 %op87, %op86
  %op89 = mul i32 %op88, %op85
  %op90 = mul i32 %op89, %op84
  %op91 = mul i32 %op90, %op83
  %op92 = mul i32 %op91, %op82
  %op93 = mul i32 %op92, %op81
  %op94 = mul i32 %op93, %op80
  %op95 = mul i32 %op94, %op79
  %op96 = mul i32 %op95, %op78
  %op97 = sdiv i32 %op96, %op77
  %op98 = sdiv i32 %op97, %op76
  %op99 = sdiv i32 %op98, %op75
  %op100 = sdiv i32 %op99, %op74
  %op101 = sdiv i32 %op100, %op73
  %op102 = sdiv i32 %op101, %op72
  %op103 = sdiv i32 %op102, %op71
  %op104 = sdiv i32 %op103, %op70
  %op105 = sdiv i32 %op104, %op69
  %op106 = sdiv i32 %op105, %op68
  store i32 %op106, i32* %op7
  %op107 = load i32, i32* %op5
  %op108 = add i32 %op107, 1
  store i32 %op108, i32* %op5
  br label %label52
}
