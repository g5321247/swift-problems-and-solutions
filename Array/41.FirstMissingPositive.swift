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
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        var i = 0

        while i < nums.count {
            let index = nums[i] - 1
            if index >= 0, index < nums.count, index + 1 != nums[index]  {
                nums.swapAt(index, i)
            } else {
                i += 1
            }
        }

        for (i, num) in nums.enumerated() {
            if num - 1 != i {
                return i + 1
            }
        }

        return nums.count + 1
    }
}

/*
[]
[-1]
[1,2,0]
[-1,2,3]
[1,2,3]
[7,8,9,10]
[1,2,1,3]
*/
