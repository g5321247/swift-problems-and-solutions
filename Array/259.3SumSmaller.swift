//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N^2)
// Space Complexity: O(N)
func threeSumSmaller(_ nums: [Int], _ target: Int) -> Int {
    var res = 0
    let nums = nums.sorted { $0 < $1 }

    for (i, num) in nums.enumerated() {
        res += threeSumSmaller(nums, target: target - num, start: i + 1)
    }

    return res
}

func threeSumSmaller(_ nums: [Int], target: Int, start: Int) -> Int {
    var l = start
    var r = nums.count - 1
    var count = 0

    while l < r {
        if nums[l] + nums[r] >= target {
            r -= 1
        } else {
            count += r - l
            l += 1
        }
    }

    return count
}

/*
test case
[1,1,1,1,1,1]
4
[1]
2
[1,2]
2
[1,2,3]
2
*/
