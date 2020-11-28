//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(n2)
// Space Complexity: O(n)
func threeSum(_ nums: [Int]) -> [[Int]] {
    let nums = nums.sorted { $0 < $1 }
    var res: [[Int]] = []

    for (i, num) in nums.enumerated() {
        if i == 0 || nums[i] != nums[i - 1] {
            res.append(contentsOf: threeSum(nums, start: i + 1, target: -num))
        }
    }

    return res
}

func threeSum(_ nums: [Int], start: Int, target: Int) -> [[Int]] {
    var l = start
    var r = nums.count - 1
    var res: [[Int]] = []

    while l < r {
        if nums[l] + nums[r] > target {
            r -= 1
        } else if nums[l] + nums[r] < target {
            l += 1
        } else {
            res.append([nums[l], nums[r], -target])
            l += 1
            r -= 1
            while nums[l] == nums[l - 1], l < r { l += 1 }
            while nums[r] == nums[r + 1], l < r { r -= 1 }
        }
    }

    return res
}

/*
test
[]
[0]
[0,0]
[0,0,0]
[-2,3,5,-1,6]
[1,1,1,1,-1,-1,2,3,-2]
*/
