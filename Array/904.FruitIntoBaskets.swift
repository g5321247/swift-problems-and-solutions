//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Sliding Window
// Time Complexity: O(N)
// Space Complexity: O(1)

func totalFruit(_ tree: [Int]) -> Int {
    var start = 0
    var maxSum = 0
    var dict: [Int: Int] = [:]

    for end in 0 ..< tree.count {
        dict[tree[end], default: 0] += 1
        while dict.keys.count > 2 {
            dict[tree[start], default: 0] -= 1
            if dict[tree[start]] == 0 { dict.removeValue(forKey: tree[start]) }
            start += 1
        }
        maxSum = max(maxSum, end - start + 1)
    }

    return maxSum
}
