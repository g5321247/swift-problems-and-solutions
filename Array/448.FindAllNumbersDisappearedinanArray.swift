//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(n)
// Space Complexity: O(1)
class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else { return [] }
        var nums = nums
        var i = 0
        var result = [Int]()

        while i < nums.count {
            let index = nums[i] - 1

            if i == index || nums[i] == nums[index] {
                i += 1
            } else {
                nums.swapAt(i, index)
            }
        }

        for (i, num) in nums.enumerated() {
            if i != (num - 1) {
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
