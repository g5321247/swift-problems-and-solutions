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
 Test case
 "("
 ")"
 "[({"
 ")]"
 "()]"
 "[()"
 "()["
 "([)]"

 "[()]"
 "[({})]"
 "[](){}"
 */

func isValid(_ s: String) -> Bool {
    var stack: [Character] = []

    for char in s {
        switch char {
        case "{", "[", "(":
            stack.append(char)
        case "}":
            let val = stack.popLast()
            if val != "{" { return false }
        case "]":
            let val = stack.popLast()
            if val != "[" { return false }
        case ")":
            let val = stack.popLast()
            if val != "(" { return false }
        default:
            break
        }
    }

    return stack.isEmpty
}
