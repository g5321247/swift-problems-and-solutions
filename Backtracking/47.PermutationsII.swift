//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N!)
// Space Complexity: O(N)
class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var nums = nums
        helper(&nums, at: 0, res: &res)
        return res
    }

    func helper(_ nums: inout [Int], at index: Int, res: inout [[Int]]) {
        guard index < nums.count else {
            res.append(nums)
            return
        }

        var set = Set<Int>()

        for i in index ..< nums.count {
            if set.insert(nums[i]).inserted {
                nums.swapAt(i, index)
                helper(&nums, at: index + 1, res: &res)
                nums.swapAt(i, index)
            }
        }
    }
}
/* test case
[0]
[1,2,3,4]
[1,1,2,2,2,3]
*/
