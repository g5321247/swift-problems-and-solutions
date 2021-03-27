//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N * 2^n)
// Space Complexity: O(N * 2^n)
class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        guard !nums.isEmpty else { return [[]] }
        let nums = nums.sorted { $0 < $1 }
        var result: [[Int]] = [[]]
        var start = 0
        var end = 0

        for i in 0 ..< nums.count {
            if i > 0,tg nums[i] == nums[i - 1] {
                start = end
            }

            end = result.count

            for j in start ..< end {
                result.append(result[j] + [nums[i]])
            }

            start = 0
        }

        return result
    }
}
