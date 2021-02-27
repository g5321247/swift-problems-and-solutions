//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(n)
// Space Complexity: O(n)
class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var sum = 0
        var prefixSum = 0
        var dict: [Int: Int] = [0: 1]

        for num in nums {
            prefixSum += num
            sum += dict[prefixSum - k, default: 0]
            dict[prefixSum, default: 0] += 1
        }

        return sum
    }
}
