//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(N)

Without considering the output array
Space Complexity: O(1)
*/
class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var top = 0
        var bottom = matrix.count - 1
        var left = 0
        var right = matrix[0].count - 1
        var dirVal = 0
        var res = [Int]()

        while top <= bottom, left <= right {
            let dir = Dir(rawValue: dirVal)!

            switch dir {
                case .right:
                    for col in left ... right { res.append(matrix[top][col]) }
                    top += 1
                case .down:
                    for row in top ... bottom { res.append(matrix[row][right]) }
                    right -= 1
                case .left:
                    for col in (left ... right).reversed() { res.append(matrix[bottom][col]) }
                    bottom -= 1
                case .up:
                    for row in (top ... bottom).reversed() { res.append(matrix[row][left]) }
                    left += 1
            }

            dirVal = (dirVal + 1) % 4
        }

        return res
    }
}

enum Dir: Int {
    case right = 0
    case down
    case left
    case up
}

/*
[[1]]
[[1],[2]]
[[1,2]]
[[1,2],[3,4]]
[[1,2,3],[4,5,6]]
[[1,2],[3,4],[5,6]]
[[1,2,3],[4,5,6],[7,8,9]]
[[1,2,3,4],[5,6,7,8],[9,10,11,12]]
*/
