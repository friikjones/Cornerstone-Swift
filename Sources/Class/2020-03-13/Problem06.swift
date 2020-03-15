import Foundation

extension Int {
    func digits() -> [Int] {
        var digits: [Int] = []
        var num = self
        repeat {
            digits.append(num % 10)
            num /= 10
        } while num != 0
        return digits.reversed()
    }
}
class PrettyNumber {
    var numberOfPreeties = 0
    func prettyNumbers(_ n: Int) -> Int {
        func isItPretty(_ num: Int) -> Bool {
            let digitsArr = num.digits()
            for i in 1..<digitsArr.count {
                if (abs(digitsArr[i] - digitsArr[i-1]) != 1) {
                    return false
                }
            }
            return true
        }
        let max = Int(NSDecimalNumber(decimal: pow(10, n) - 1))
        let min = Int(NSDecimalNumber(decimal: pow(10, n-1)))
        for i in min...max {
            numberOfPreeties += (isItPretty(i)) ? 1 : 0
        }
        return numberOfPreeties
    }
}