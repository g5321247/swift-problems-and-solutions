//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(n!)
// Space Complexity: O(n!)
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        return helper(&nums, start: 0)
    }

    func helper(_ nums: inout [Int], start: Int) -> [[Int]] {
        guard start < nums.count else { return [nums] }
        var res: [[Int]] = []

        for i in start ..< nums.count {
            nums.swapAt(i, start)
            res.append(contentsOf: helper(&nums, start: start + 1))
            nums.swapAt(i, start)
        }

        return res
    }
}
