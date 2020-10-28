//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Solution
// Time Complexity: O(N)
// Space Complexity: O(M) M -> number of unique words in s

/*
test case:
pattern, s
"a","a" -> true
"aba", "dog dog dog" -> false
"aaa", "dog dog dog" -> true
"aba", "dog fish duck" -> false

*/

func wordPattern(_ pattern: String, _ s: String) -> Bool {
    let sArray = s.components(separatedBy: " ")
    guard sArray.count == pattern.count else { return false }
    let patternArray = Array(pattern)
    var dict: [String: Character] = [:]
    var dict2: [Character: String] = [:]

    for i in 0 ..< patternArray.count {
        if let char = dict[sArray[i]] {
            if char != patternArray[i] { return false }
        }

        if let str = dict2[patternArray[i]] {
            if str != sArray[i] { return false }
        }

        dict[sArray[i]] = patternArray[i]
        dict2[patternArray[i]] = sArray[i]
    }

    return true
}
