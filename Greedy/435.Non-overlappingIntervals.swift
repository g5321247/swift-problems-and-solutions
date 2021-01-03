//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(nlogn)
Space Complexity: O(1)
*/

class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        guard !intervals.isEmpty else { return 0 }
        let intervals = intervals.sorted { $0[0] < $1[0] }
        var count = 0
        var currEnd = intervals[0][1]

        for i in 1 ..< intervals.count {
            if currEnd > intervals[i][0] {
                // Remove the longer one, cause the minimum end will be always overlap less interval
                currEnd = min(intervals[i][1], currEnd)
                count += 1
            } else {
                currEnd = intervals[i][1]
            }
        }

        return count
    }
}

/*
Test case
[]
[[1,4]]
[[1,5], [2,3], [4,10]]
[[1,10], [3,5], [7,8], [9,10]]
[[2,4],[3,5],[9,20]]
[[1,2],[2,3],[3,4],[1,3]]
[[1,2],[2,3]]
[[0,2],[1,3],[2,4],[3,5],[4,6]]

*/
