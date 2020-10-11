//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Sliding Window
// Time Complexity: O(N)
// Space Complexity: O(1)

func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }

    var minCount = Int.max
    var start = 0
    var sum = 0

    for end in 0 ..< nums.count {
        sum += nums[end]
        while sum >= s {
            minCount = min(minCount, end - start + 1)
            sum -= nums[start]
            start += 1
        }
    }

    return minCount == Int.max ? 0 : minCount
}
