//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Solution: Stack(最佳解)
// Time Complexity: O(n)
// Space Complexity: O(n)
// stack 是存 index 而不是高度
// 參考： https://www.youtube.com/watch?v=GYuBQacXr1A

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack = [-1]
        var res = 0

        for i in heights.indices {
            while stack.last != -1, heights[i] <= heights[stack.last!] {
                let j = stack.removeLast()
                res = max(res,  (i - stack.last! - 1) * heights[j])
            }

            stack.append(i)
        }

        while stack.last != -1 {
            let j = stack.removeLast()
            res = max(res,  (heights.count - stack.last! - 1) * heights[j])
        }

        return res
   }
}

// Solution: Divide and Conquer
// Time Complexity: O(nlogn)
// Space Complexity: O(n)
/*
思路：最大面積不外乎下列三者之一：
 1.最小高度乘以全長
 2.最小高度左側的最大面積（不包括最小高度）
 3.最小高度右側的最大面積（不包括最小高度）
 參考：https://ithelp.ithome.com.tw/articles/10229343
*/

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        return largestRectangleArea(heights, 0, heights.count - 1)
   }

    func largestRectangleArea(_ heights: [Int], _ start: Int, _ end: Int) -> Int {
        guard end >= start else { return 0 }
        var minIndex = start

        for i in start ... end {
            if heights[minIndex] > heights[i] {
                minIndex = i
            }
        }

        let left = largestRectangleArea(heights, start, minIndex - 1)
        let right = largestRectangleArea(heights, minIndex + 1, end)
        let all = heights[minIndex] * (end - start + 1)
        return max(all, max(left, right))
    }
}
