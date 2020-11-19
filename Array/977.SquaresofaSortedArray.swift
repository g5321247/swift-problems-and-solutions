//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N)
// Space Complexity: O(N)
func sortedSquares(_ A: [Int]) -> [Int] {
    var res = Array(repeating: 0, count: A.count)
    var l = 0
    var r = A.count - 1

    for i in res.indices.reversed() {
        let lSquared = A[l] * A[l]
        let rSquared = A[r] * A[r]

        if lSquared >= rSquared {
            res[i] = lSquared
            l += 1
        } else {
            res[i] = rSquared
            r -= 1
        }
    }

    return res
}
