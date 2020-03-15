func OneTwoThree(_ N: Int) -> Int{
    var fib = [Int](repeating: 0, count: N+3)
    fib[0] = 0
    fib[1] = 0
    fib[2] = 1
    for i in 3..<fib.count{
        fib[i] = fib[i-1]+fib[i-2]+fib[i-3]
    }
    return fib[N+2]
}