//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(n^2)
Space Complexity: O(n)
*/

class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        let people = people.sorted {
            if $0[0] == $1[0] { return $0[1] < $1[1]
            }
            return $0[0] > $1[0]
        }

        var result = [[Int]]()

        for p in people {
            result.insert(p, at: p[1])
        }

        return result
    }
}
