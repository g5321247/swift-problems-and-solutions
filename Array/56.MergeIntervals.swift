//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(NlogN)
// Space Complexity: O(N)
class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        // nlogn
        let intervals = intervals.sorted { $0[0] < $1[0] }
        var i = 0
        var result: [[Int]] = [intervals[0]]

        for interval in intervals {
            if interval[0] > result[i][1] {
                result.append(interval)
                i += 1
            } else {
               result[i][1] = max(interval[1], result[i][1])
            }
        }

        return result
    }
}

/*
Test case
line 1(ab) line2 (cd)

overlap
1. a <= c <= b <= d [1,3],[2,8],[1,6]
2. a <= c <= d <= b [1,5],[2,4] [1,5], [2,5]
3. c <= a <= d <= b [2,4],[1,3]
4. c <= a <= b <= d [2,5], [1,5]

not overlap
1. a <= b <= c <= d [2,3], [4,5]
2. c <= d <= a = b [6,10], [1,2]
*/
