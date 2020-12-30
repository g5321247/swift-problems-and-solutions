//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N)
// Space Complexity: O(N)
class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var curr = newInterval
        var i = 0

        while i < intervals.count, intervals[i][1] < curr[0] {
            result.append(intervals[i])
            i += 1
        }

        while i < intervals.count, curr[1] >= intervals[i][0] {
            curr[0] = min(curr[0], intervals[i][0])
            curr[1] = max(curr[1], intervals[i][1])
            i += 1
        }

        result.append(curr)

        while i < intervals.count {
            result.append(intervals[i])
            i += 1
        }

        return result
    }
}

/*
test case
[]
[1,5]

要注意這個會 index out of range
[[1,5]]
[2,3]

[[3,4], [5,9], [10, 12]]
[1,2]

[[1,3], [5,9], [10, 12]]
[1,2]

[[1,3], [5,9], [10, 12]]
[2,5]

[[1,3], [5,9], [13, 16]]
[8, 14]

[[1,3], [5,9], [13, 16]]
[19,23]
*/
