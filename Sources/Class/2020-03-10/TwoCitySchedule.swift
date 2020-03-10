
func twoCitySchedCost(_ costs: [[Int]]) -> Int {
    var input = costs
    let n = input.count/2
    var output = 0
    var aCount = 0
    var bCount = 0
    input = input.sorted(by: { abs($0[0] - $0[1]) > abs($1[0] - $1[1]) })
    for pair in input {
        if aCount < n && bCount < n {
            if pair[0] < pair[1] {
                output += pair[0]
                aCount += 1
            } else {
                output += pair[1]
                bCount += 1
            }
        } else {
            if aCount < n {
                output += pair[0]
                aCount += 1
            } else {
                output += pair[1]
                bCount += 1
            }
        }
    }
    return output
}

