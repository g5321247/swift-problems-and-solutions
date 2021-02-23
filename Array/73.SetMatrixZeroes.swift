//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(nm)
// Space Complexity: O(1)
class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var isFirstRowZero = false
        var isFirstColumnZero = false

        for row in matrix.indices {
            if matrix[row][0] == 0 {
                isFirstColumnZero = true
                break
            }
        }

        for column in matrix[0].indices {
            if matrix[0][column] == 0 {
                isFirstRowZero = true
                break
            }
        }

        for row in 1 ..< matrix.count {
            for column in 1 ..< matrix[row].count {
                if matrix[row][column] == 0 {
                    matrix[0][column] = 0
                    matrix[row][0] = 0
                }
            }
        }

        for row in 1 ..< matrix.count {
            for column in 1 ..< matrix[row].count {
                if matrix[0][column] == 0 || matrix[row][0] == 0 {
                    matrix[row][column] = 0
                }
            }
        }

        if isFirstColumnZero {
            for row in matrix.indices {
                matrix[row][0] = 0
            }
        }

        if isFirstRowZero {
            for column in matrix[0].indices {
                matrix[0][column] = 0
            }
        }

    }
}
