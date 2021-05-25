//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(mn)
Space Complexity: O(mn)
ref:
https://www.youtube.com/watch?v=zV3o4XVoU8M
*/

/*
思路：
想成 Pacific ocean 和 Atlantic ocean 兩個最多可以流到哪邊，
當兩個都可以流到的地方，就是答案。

Pacific ocean 起點為上面和左邊每個點，看每個點最多可以流到哪裡，流過的點就不必再流
Atlantic ocean 起點為下面和右邊每個點，看每個點最多可以流到哪裡，流過的點就不必再流
*/
class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        let m = heights.count
        let n = heights[0].count
        var p = Array(repeating: Array(repeating: false, count: n) ,count: m)
        var a = p
        var res = [[Int]]()

        for i in 0 ..< m {
            // left
            flow(0, i, 0, heights, &p)
            // right
            flow(n - 1, i, 0, heights, &a)
        }

        for i in 0 ..< n {
            // top
            flow(i, 0, 0, heights, &p)
            // bottom
            flow(i, m - 1, 0, heights, &a)
        }

        for i in 0 ..< m {
            for j in 0 ..< n {
                if p[i][j], a[i][j] {
                    res.append([i, j])
                }
            }
        }


        return res
    }

    func flow(_ x: Int, _ y: Int, _ h: Int, _ heights: [[Int]], _ area: inout [[Bool]]) {
        if x < 0 || x == heights[0].count || y < 0 || y == heights.count { return }
        if area[y][x] || h > heights[y][x] { return }

        area[y][x] = true
        flow(x - 1, y, heights[y][x], heights, &area)
        flow(x + 1, y, heights[y][x], heights, &area)
        flow(x, y - 1, heights[y][x], heights, &area)
        flow(x, y + 1, heights[y][x], heights, &area)

    }
}
