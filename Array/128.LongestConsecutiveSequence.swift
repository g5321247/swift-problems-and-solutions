//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(n)
// Space Complexity: O(n)
class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var set: Set<Int> = []
        var maxLength = 0
        var currLength = 0

        for num in nums {
            set.insert(num)
        }

        for num in nums {
            currLength = 1

            if !set.contains(num - 1) {
                var i = 1
                while set.contains(num + i) {
                    currLength += 1
                    i += 1
                }
            }

            maxLength = max(maxLength, currLength)
        }

        return maxLength
    }
}
