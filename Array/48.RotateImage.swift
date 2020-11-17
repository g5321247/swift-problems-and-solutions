//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N2)
// Space Complexity: O(1)

func rotate(_ matrix: inout [[Int]]) {
    // transpose(置換矩陣)
    for i in 0 ..< matrix.count {
        for j in i ..< matrix.count {
            let tmp = matrix[i][j]
            matrix[i][j] = matrix[j][i]
            matrix[j][i] = tmp
        }
    }

    // reverse
    for i in 0 ..< matrix.count {
        let count = matrix.count - 1
        for j in 0 ... (count) / 2  {
            matrix[i].swapAt(j, count - j)
        }
    }
}
