//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(NM)
Space Complexity: O(NM)
*/

/*
Subsequence -> 順序不能改變
eg: abcd -> ab, ac, ad, abc ...
ca 不是 subsequence，因為順序 a 在 c 前面
*/

// Top-down
class Solution {

    var memo:[String: Int] = [:]

    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        return longestCommonSubsequence(Array(text1), Array(text2), 0, 0)
    }

    func longestCommonSubsequence(_ text1: [Character], _ text2: [Character], _ s1Inedx: Int, _ s2Index: Int) -> Int {
        guard s1Inedx < text1.count, s2Index < text2.count else { return 0 }
        if let count = memo["\(s1Inedx)\(s2Index)"] { return count }

        if text1[s1Inedx] == text2[s2Index] {
            // 若兩個相同，就要一起進一位
            memo["\(s1Inedx)\(s2Index)"] = 1 + longestCommonSubsequence(text1, text2, s1Inedx + 1, s2Index + 1)
        } else {
            let nextS1 = longestCommonSubsequence(text1, text2, s1Inedx + 1, s2Index)
            let nextS2 = longestCommonSubsequence(text1, text2, s1Inedx, s2Index + 1)
            memo["\(s1Inedx)\(s2Index)"] = max(nextS1, nextS2)
        }

        return memo["\(s1Inedx)\(s2Index)", default: 0]
    }
}

// Bottom-up
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let text1 = Array(text1)
        let text2 = Array(text2)
        var res = 0
        var memo:[String: Int] = [:]

        for i in text1.indices.reversed() {
            for j in text2.indices.reversed() {
                if text1[i] == text2[j] {
                    memo["\(i)\(j)"] = memo["\(i + 1)\(j + 1)", default: 0] + 1
                } else {
                    memo["\(i)\(j)"] = max(memo["\(i + 1)\(j)", default: 0], memo["\(i)\(j + 1)", default: 0])
                }
            }
        }

        return memo["00", default: 0]
    }
}
