//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(n)
// Space Complexity: O(1)
// 可以不用 cycle list sort，直接把有對到的 index 用負數做標記比較快

class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else { return [] }
        var nums = nums
        var result = [Int]()

        for (i, num) in nums.enumerated() {
            let index = abs(nums[i]) - 1
            nums[index] = nums[index] > 0 ? -nums[index] : nums[index]
        }

        for (i, num) in nums.enumerated() {
            if num > 0 {
                result.append(i + 1)
            }
        }
        return result
    }
}
/*
[]
[1,2,3,4]
[2,2,2,3]
[1]
*/
