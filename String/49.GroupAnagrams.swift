//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/* Solution
N: number of string,  K: maximum length of string
Time Complexity: O(NK)
Space Complexity: O(NK)
*/

func groupAnagrams(_ strs: [String]) -> [[String]] {
    let dict = strs.reduce(into: [:]) { res, str in
        res[hash(str), default: []].append(str)
    }

    return Array(dict.values)
}

func hash(_ str: String) -> [Int] {
    var res = Array(repeating: 0, count: 26)

    for char in str {
        let index = Int(char.asciiValue! - Character("a").asciiValue!)
        res[index] += 1
    }

    return res
}
