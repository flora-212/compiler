define dso_local i32 @callee(i32 noundef %0) #0 {
    %2 = alloca i32, align 4
    store i32 %0, i32* %2, align 4
    %3 = alloca i32, align 4
    store i32 2, i32* %3, align 4
    %4 = load i32, i32* %2, align 4
    %5 = load i32, i32* %3, align 4
    %6 = mul i32 %4, %5
    ret i32 %6
}

define dso_local i32 @main() #0 {
    %1 = alloca i32, align 4
    store i32 110, i32* %1, align 4
    %2 = load i32, i32* %1, align 4
    %3 = call i32 @callee(i32 %2)
    ret i32 %3
}