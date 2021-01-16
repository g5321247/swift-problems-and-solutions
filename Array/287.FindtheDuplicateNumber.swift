//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N)
// Space Complexity: O(1)

//class Solution {
//    func findDuplicate(_ nums: [Int]) -> Int {
//        var nums = nums
//
//        for (i, num) in nums.enumerated() {
//            let index = abs(nums[i]) - 1
//            if nums[index] < 0 { return index + 1 }
//
//            nums[index] = -nums[index]
//        }
//
//        return 0
//    }
//}

/* 完全不修改 Array 的解
快慢指針解

由於一開始沒有 0，並且 size 為 n + 1，所以不必擔心 nums[0] 為 0 造成卡在原本地方找錯的問題
Time Complexity: O(N)
Space Complexity: O(1)
*/

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var fast = nums[0]
        var slow = nums[0]

        repeat {
            slow = nums[slow]
            fast = nums[nums[fast]]
        } while fast != slow

        fast = nums[0]

        while fast != slow {
            slow = nums[slow]
            fast = nums[fast]
        }

        return fast
    }
}
