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
    func isPalindrome(_ s: String) -> Bool {
        let sArray = Array(s)
        var l = 0
        var r = sArray.count - 1

        while l < r {
            while l < r, !sArray[l].isNumber, !sArray[l].isLetter {
                l += 1
            }

            while l < r, !sArray[r].isNumber, !sArray[r].isLetter {
                r -= 1
            }

            if String(sArray[l]).lowercased() != String(sArray[r]).lowercased() {
                return false
            }

            l += 1
            r -= 1
        }

        return true
    }
}

/*
"A man, a plan, a canal: Panama"
"race a car"
"a"
"a,"
"a,b A"
"0P"
*/
