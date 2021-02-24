//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Solution
// Time Complexity: O(n)
// Space Complexity: O(1)

class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        let sArray = Array(S)
        var res: [Int] = []
        var dict: [Character: Int] = [:]
        var start = 0
        var currEnd = 0

        for (end, char) in sArray.enumerated() { dict[char] = end }

        for (end, char) in sArray.enumerated() {
            currEnd = max(currEnd, dict[char]!)

            if end == currEnd {
                res.append(currEnd - start + 1)
                start = end + 1
            }
        }

        return res
    }
}

/*
"ababcbacadefegdehijhklij"
"abcda"
"acbaefb"
*/
