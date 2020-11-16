//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Solution
// Time Complexity: O(N)
// Space Complexity: O(N)

/*
test case:
 "3[a]2[bc]"
 ""
 "eabc"
 "e2[ab]"
 "e2[a]3[b]e"
 "e2[a3[b]]"
 "e2[3[b]a]"
 "e2[3[b]a2[c]]"
 "e2[3[b]a2[c2[de]]]"
 "100[leecode]"
*/

func decodeString(_ s: String) -> String {
    var stack: [(String, Int)] = []
    var result = ""
    var number = 0

    for char in s {
        if char == "[" {
            stack.append((result, number))
            result = ""
            number = 0
        } else if char == "]" {
            let (prev, count) =  stack.removeLast()
            result = prev + String(repeating: result, count: count)

        } else if char.isNumber {
            number = number * 10 + Int(String(char))!
        } else {
            result += "\(char)"
        }
    }

    return result
}
