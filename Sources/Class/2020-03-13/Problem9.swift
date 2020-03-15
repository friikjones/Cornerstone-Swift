class JudgeSquareSum {
    func judgeSquareSum(_ c: Int) -> Bool {
        var ret = false
        var sum = 0
        var i = c
        while (i > 0) {
            if (i * i + sum <= c) {
                sum += i * i
            }
            if (i * i + sum <= c) {
                sum += i * i
            }
            if (sum == c) {
                ret = true
                break
            }
            i -= 1
        }
        return ret
    }
}