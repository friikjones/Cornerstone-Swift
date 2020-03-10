class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        let gas2x = gas + gas
        let cost2x = cost + cost
        var indexPossible = -1
        var steps = 0
        var r = 0
        for i in 0..<gas2x.count {
            if ((r + gas2x[i]) - cost2x[i] > 0) {
                r = (r + gas2x[i]) - cost2x[i]
                steps += 1
                if (indexPossible < 0) {
                    indexPossible = i
                }
            }
        }
        if (steps < gas.count) {
            indexPossible = -1
        }
        return indexPossible
    }
}