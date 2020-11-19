//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(MN)
Space Complexity: O(1)
*/

func minPathSum(_ grid: [[Int]]) -> Int {
    var grid = grid

    for i in 1 ..< grid[0].count {
        grid[0][i] += grid[0][i - 1]
    }

    for i in 1 ..< grid.count {
        grid[i][0] += grid[i - 1][0]

        for j in 1 ..< grid[i].count {
            grid[i][j] += min(grid[i - 1][j], grid[i][j - 1])
        }
    }

    return grid.last!.last!
}
