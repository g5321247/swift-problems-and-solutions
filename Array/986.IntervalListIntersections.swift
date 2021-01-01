//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(m + n)
// Space Complexity: O(m + n)
class Solution {
    func intervalIntersection(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        var i = 0
        var j = 0

        while i < A.count, j < B.count {
            let s1 = A[i][0]; let e1 = A[i][1]
            let s2 = B[j][0]; let e2 = B[j][1]

            if s1 <= e2, s2 <= e1 {
                result.append([max(s1, s2), min(e1, e2)])
            }

            if e1 > e2 {
                j += 1
            } else {
                i += 1
            }
        }

        return result
    }
}
