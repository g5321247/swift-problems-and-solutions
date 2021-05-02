//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time complexity: O(logn)
Space complexity: O(1)
*/

class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        var l = 0
        var r = letters.count - 1

        while l <= r {
            let mid = (l + r) / 2

            if letters[mid] <= target {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }

        return letters[l % letters.count]
    }
}

/*
["c","f","j"]
"a"
["b","d","g"]
"a"
["a","c","f"]
"b"
["a","a","a","b","b","c"]
a
*/
