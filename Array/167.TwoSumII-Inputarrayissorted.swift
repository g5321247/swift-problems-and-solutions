//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N)
// Space Complexity: O(1)

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var l = 0
    var r = numbers.count - 1

    while l < r {
        if target < numbers[l] + numbers[r] {
            r -= 1
        } else if target > numbers[l] + numbers[r] {
            l += 1
        } else {
            return [l + 1, r + 1]
        }
    }

    return [l + 1, r + 1]
}
