//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N)
// Space Complexity: O(1)

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var end = 0
    var i = 0

    while i < nums.count {
        if nums[i] != val {
            nums[end] = nums[i]
            end += 1
        }
        i += 1
    }

    return end
}
