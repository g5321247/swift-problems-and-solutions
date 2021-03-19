//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
M = subSum
Time Complexity: O(N * √N)
Space Complexity: O(N)
*/

class Solution {
    func numSquares(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        var dp = Array(repeating: Int.max, count : n + 1)
        dp[0] = 0

        for i in 1 ... n {
            let sqrtNum = Int(sqrt(Double(i)))

            for j in 1 ... sqrtNum {
                // 這邊的 1 是 j * j，因為 j * j 可以被開平方，所以 perfect squares 的 count 一定是 1
                dp[i] = min(dp[i], dp[i - j * j] + 1)
            }
        }

        return dp[n]
    }
}
