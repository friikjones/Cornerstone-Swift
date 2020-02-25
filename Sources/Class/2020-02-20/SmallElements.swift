func smallElements(amount: Int) -> [Int] {
    var output = Array<Int>(repeating: Int.max, count: amount)
    //Assuming the first item on the stream is the size of the input
    let n = Int(readLine()!)!

    var left: Int
    var right: Int
    //go through the entire input stream
    for _ in 0..<n{
        //finding the spot on the list to place it
        let x = Int(readLine()!)!
        left = 0
        right = output.count-1
        while left != right {
            if x > output[(left+right)/2]{
                left = (left+right)/2
                print("left: \(left)")
            }else{
                right = (left+right)/2
                print("right: \(right)")
            }
        }
        output.insert(x, at: left)
        output.removeLast()
    }
        
    //finding 

    return output
}