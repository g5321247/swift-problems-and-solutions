//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Solution
// Time Complexity: O(n)
// Space Complexity: O(n)

class Solution {
    func frequencySort(_ s: String) -> String {
        var dict: [Character: String] = [:]
        var bucket = Array(repeating: "", count: s.count + 1)
        var res = ""

        s.forEach { dict[$0, default: ""] += String($0) }
        dict.values.forEach { bucket[$0.count] += $0 }
        bucket.reversed().forEach { res += $0 }

        return res
    }
}
