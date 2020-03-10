import Foundation

func partitionLabels() -> [Int] {
    var input = readLine()!.map { String($0)}
    var output = [Int]()

    while input.count > 0 { 
    //while string.count > 0
        var done = false
        var foundLetters = [String]()
        var firstChar = input.first!
        foundLetters.append(firstChar) 
        while !done {
            let index = Int(input.lastIndex(of: firstChar)!)
            for i in 0..<index{
                if !foundLetters.contains(input[i]){
                    foundLetters.append(input[i])
                }
            }
            done = true
            for char in foundLetters{
                if input.lastIndex(of: char)! > index {
                    done = false
                    firstChar = String(char)
                    break
                }
            }
            if done {
                output.append(index+1)
                let range = input.startIndex...input.index(input.startIndex, offsetBy: index)
                input.removeSubrange(range)
            }
        }
    }

    return output
}