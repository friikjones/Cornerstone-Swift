func TwoxNTitles(_ N: Int) -> Int{
    var fib = [Int](repeating: 0, count: N+2)
    fib[0] = 0
    fib[1] = 1
    for i in 2..<fib.count{
        fib[i] = fib[i-1]+fib[i-2]
    }
    return fib[N+1]
}