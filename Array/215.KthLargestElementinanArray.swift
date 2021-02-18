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
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        let target = nums.count - k
        var l = 0
        var r = nums.count - 1

        while l <= r {
            let pivot = helper(&nums, l: l, r: r)
            if target == pivot {
                return nums[target]
            } else if target > pivot {
                l = pivot + 1
            } else {
                r = pivot - 1
            }
        }

        return -1
    }

    func helper(_ nums: inout [Int], l: Int, r: Int) -> Int {
        // 這邊用 random index 當作 pivot number 是避免 worst case 發生
        let pickedPivotIndex = Int.random(in: l...r)
        let pivotNum = nums[pickedPivotIndex]
        nums.swapAt(pickedPivotIndex, r)

        var pivot = l

        for i in l ... r {
            if nums[i] <= pivotNum {
                nums.swapAt(pivot, i)
                pivot += 1
            }
        }

        return pivot - 1
    }
}

/*
Test case
[3,2,1,5,6,4]
2
[1]
1
[3,2,1,5,6,4]
1
[3,2,1,5,6,4]
6
*/
