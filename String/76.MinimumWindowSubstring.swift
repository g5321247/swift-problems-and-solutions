//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Solution
// Time Complexity: O(S + T)
// Space Complexity: O(T)

func minWindow(_ s: String, _ t: String) -> String {
    guard s.count >= t.count else { return "" }
    var dict: [Character: Int] = [:]
    let sArray = Array(s)

    for char in t {
        dict[char, default: 0] += 1
    }

    var match = t.count
    var minLength = Int.max
    var start = 0
    var lengthStart = 0

    for (i, char) in sArray.enumerated() {
        if let val = dict[char] {
            dict[char, default: 0] = val - 1
            if val > 0 {
                match -= 1
            }
        }

        while match == 0 {
            if let val = dict[sArray[start]] {
                dict[sArray[start]] = val + 1

                if val >= 0 {
                    match += 1
                }
            }

            if (i - start + 1) < minLength {
                minLength = (i - start + 1)
                lengthStart = start
            }

            start += 1
        }
    }

    return minLength == Int.max ? "" : String(sArray[lengthStart ..< lengthStart + minLength])
}
