//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(n)
// Space Complexity: O(1)
// ref: https://www.youtube.com/watch?v=r8BAp3lFZ48&t=1117s&ab_channel=%E5%B1%B1%E6%99%AF%E5%9F%8E%E4%B8%80%E5%A7%90

class Solution {
    func findMaximumXOR(_ nums: [Int]) -> Int {
        var maxVal = 0
        var mask = 0
        var maxResult = 0

        for num in nums {
            maxVal = max(maxVal, num)
        }

        let length = String(maxVal, radix: 2).count - 1

        for i in stride(from: length, through: 0, by: -1) {
            mask = mask | (1 << i)
            var set: Set<Int> = []

            for num in nums {
                set.insert(mask & num)
            }

            let tmp = maxResult | 1 << i

            for prefix in set {
                if set.contains(prefix ^ tmp) {
                    maxResult = tmp
                    break
                }
            }
        }

        return maxResult
    }
}
