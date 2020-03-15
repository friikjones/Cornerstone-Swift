class LengthOfLIS {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var increasingList = [Int]()
        increasingList.append(nums[0])
        for i in 1..<nums.count {
            if (nums[i] < increasingList[increasingList.count - 1]) {
                increasingList.remove(at: increasingList.count - 1)
                increasingList.append(nums[i])
            }else {
                increasingList.append(nums[i])
            }
        }
        return increasingList.count
    }
}