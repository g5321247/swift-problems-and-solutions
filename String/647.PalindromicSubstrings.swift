//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Solution
// Time Complexity: O(n^2)
// Space Complexity: O(1)

class Solution {
    func countSubstrings(_ s: String) -> Int {
        let chars = Array(s)
        var count = 0

        for i in 0 ..< chars.count {
            // odd palindromic
            count += countPalindromic(chars, l: i, r: i)
            // even palindromic
            count += countPalindromic(chars, l: i, r: i + 1)
        }

        return count
    }

    func countPalindromic(_ chars: [Character], l: Int, r: Int) -> Int {
        var l = l
        var r = r
        var count = 0

        while l >= 0, r < chars.count, chars[l] == chars[r] {
            count += 1
            l -= 1
            r += 1
        }

        return count
    }
}
