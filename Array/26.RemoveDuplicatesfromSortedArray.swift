//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N)
// Space Complexity: O(1)

func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    var end = 1

    for i in 1 ..< nums.count {
        if nums[i] != nums[i - 1] {
            nums[end] = nums[i]
            end += 1
        }
    }

    return end
}
