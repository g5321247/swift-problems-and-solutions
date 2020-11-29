//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(MN)
Space Complexity: O(MN)
*/

func numIslands(_ grid: [[Character]]) -> Int {
    var count = 0
    var grid = grid

    for row in 0 ..< grid.count {
        for column in 0 ..< grid[0].count {
            if grid[row][column] == "1" {
                count += 1
                dfs(&grid, x: row, y: column)             
            }
        }

    }

    return count
}

func dfs(_ grid: inout [[Character]], x: Int, y: Int) {
    guard x >= 0, x < grid.count else { return }
    guard y >= 0, y < grid[0].count else { return } 
    guard grid[x][y] != "0" else { return }

    grid[x][y] = "0"
    dfs(&grid, x: x + 1, y: y) 
    dfs(&grid, x: x - 1, y: y) 
    dfs(&grid, x: x, y: y + 1) 
    dfs(&grid, x: x, y: y - 1)
}

/*
test case
["1"]
["0"]
[["1","1","1"]]
[["1","0","1"]]
[["1"],["1"],["1"]]
[["1"],["0"],["1"]]
[["1","1","1"],["1","1","1"],["1","1","1"]]
[["1","1","1"],["1","0","0"],["0","1","1"]]
[["0","1","0"],["1","1","0"],["0","0","1"]]

*/
