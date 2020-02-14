import Foundation

func evaluateHelper(_ expr: String, _ index: inout Int) -> Int {
    if Character(expr[index]).isNumber {
        return Int(expr[index])!
    } else {
        index += 1 // skip (
        let left = evaluateHelper(expr, &index)
        index += 1
        let op = expr[index] // +, *
        index += 1
        let right = evaluateHelper(expr, &index)
        index += 1 // skip )
        if op == "+" {
            return left + right
        } else {
            return left * right
        }
    }
}

func evaluate(_ expr: String) -> Int {
    var i = 0
    return evaluateHelper(expr, &i)
}