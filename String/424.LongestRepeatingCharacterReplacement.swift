//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Solution
// Time Complexity: O(N)
// Space Complexity: O(1)
//As we are expecting only the lower case letters in the input string, we can conclude that the space complexity will be O(26), to store each letter’s frequency in the HashMap, which is asymptotically equal to O(1).

func characterReplacement(_ s: String, _ k: Int) -> Int {
    let sArray = Array(s)
    var dict: [Character: Int] = [:]
    var start = 0
    var maxCount = 0

    for (end, char) in sArray.enumerated() {
        dict[char, default: 0] += 1
        maxCount = max(dict[char, default: 0], maxCount)

        if (end - start + 1) > (maxCount + k) {
            dict[sArray[start], default: 0] -= 1
            start += 1
        }
    }

    return sArray.count - start
}
