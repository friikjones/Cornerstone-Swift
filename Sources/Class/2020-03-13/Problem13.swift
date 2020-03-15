class MaximumSubarray {
    func maxSubArray(_ nums: [Int]) -> Int {
        var outputArray = [Int](repeating: 0, count: nums.count)
        for i in 0..<nums.count{
            var sum = 0
            for j in i..<nums.count{
                sum += nums[j]
                if sum > outputArray[i]{
                    outputArray[i] = sum
                }
            }
        }
        var max = 0
        for n in outputArray{
            if n > max{
                max = n
            }
        }
        return max
    }
}