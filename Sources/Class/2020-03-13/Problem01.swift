class ClimbingStairs {
    var memo = [Int](repeating: 0, count: 100);
    func climbStairs(_ n: Int) -> Int {
        if (n <= 1) {
            return 1;
        }
        if (memo[n] > 0) {
            return memo[n];
        }
        memo[n] = climbStairs(n-1) + climbStairs(n-2);
        return memo[n];
    }
}