//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N2)
// Space Complexity: O(N2)

func generate(_ numRows: Int) -> [[Int]] {
    guard numRows > 0 else { return [] }
    var results: [[Int]] = [[1]]

    for row in 0 ..< numRows - 1 {
        let prev = results[row]
        var curr = [1]

        var i = 1
        while i < prev.count {
            curr.append(prev[i] + prev[i - 1])
            i += 1
        }

        curr.append(1)
        results.append(curr)
    }

    return results
}
