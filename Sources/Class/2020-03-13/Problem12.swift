class Solution {
    func numDecodings(_ s: String) -> Int {
        var output = 0
        let sArray = Array(s)
        print(sArray)
        for i in 1..<sArray.count{
            print(sArray[i])
            if sArray[i] < "7" && sArray[i-1] < "3" || sArray[i-1] == "1" {
                print(true)
                output += 1
            }else{
                print(false)
            }
        }
        
        return output+1
    }
}