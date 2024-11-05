define dso_local i32 @main() #0 {
    %1 = alloca i32, align 4
    %2 = alloca i32, align 4
    store i32 10, i32* %1
    store i32 0, i32* %2
    %3 = alloca i32, align 4
    store i32 10, i32* %3
    %4 = load i32, i32* %3
    %5 = alloca i32, align 4
    store i32 1, i32* %5
    %6 = load i32, i32* %5
    br label %7

7:
    %8 = load i32, i32* %2
    %9 = icmp slt i32 %8, %4
    br i1 %9, label %10, label %16

10:
    %11 = load i32, i32* %2
    %12 = add i32 %11, %6
    store i32 %12, i32* %2
    %13 = load i32, i32* %1
    %14 = load i32, i32* %2
    %15 = add i32 %13, %14
    store i32 %15, i32* %1
    br label %7

16:
    %17 = load i32, i32* %1
    ret i32 %17
}