define dso_local i32 @main() #0 {
    %1 = alloca float, align 4
    store float 0x40163851E0000000, float* %1, align 4
    %2 = alloca float, align 4
    store float 0x3FF0000000000000, float* %2, align 4
    %3 = load float, float* %1, align 4
    %4 = load float, float* %2, align 4
    %5 = fcmp ugt float %3, %4
    %6 = alloca i32, align 4
    br i1 %5, label %7, label %8

7:
    store i32 233, i32* %6, align 4
    br label %9

8:
    store i32 0, i32* %6, align 4
    br label %9

9:
    %10 = load i32, i32* %6, align 4
    ret i32 %10
}
