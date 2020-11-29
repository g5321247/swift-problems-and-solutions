//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(MN)
Space Complexity: O(MN)
*/

func canPartition(_ nums: [Int]) -> Bool {
    var sum = 0

    for num in nums {
        sum += num
    }

    if sum % 2 != 0 { return false }

    let subSum = sum / 2
    var dp = Array(repeating: false, count: subSum + 1)
    dp[0] = true

    for num in nums {
        var i = subSum
        while i >= num {
            dp[i] = dp[i] || dp[i - num]
            i -= 1
        }
    }

    return dp[subSum]
}
