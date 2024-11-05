define dso_local i32 @main() #0 {
    %1 = alloca i32, align 4
    store i32 0, i32* %1, align 4
    %2 = alloca [10 x i32], align 16
    %3 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 0
    store i32 10, i32* %3, align 4
    %4 = mul i32 10, 2
    %5 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 1
    store i32 %4, i32* %5, align 4
    %6 = load i32, i32* %5, align 4
    ret i32 %6
}