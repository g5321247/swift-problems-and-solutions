//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N)
// Space Complexity: O(1)

func productExceptSelf(_ nums: [Int]) -> [Int] {
    var result: [Int] = Array(repeating: 1, count: nums.count)

    for i in nums.indices {
        if i > 0 {
            result[i] = result[i - 1] * nums[i - 1]
        }
    }

    var r = 1

    for i in nums.indices.reversed() {
        result[i] *= r
        r *= nums[i]
    }

    return result
}
