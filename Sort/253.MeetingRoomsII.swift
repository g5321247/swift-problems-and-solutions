//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// 其他語言可以用 min Heap 作
// Time Complexity: O(nlogn)
// Space Complexity: O(n)

class Solution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        let starts = intervals.sorted { $0[0] < $1[0] }
        let ends = intervals.sorted { $0[1] < $1[1] }
        var count = 0
        var i = 0

        for start in starts {
            if start[0] < ends[i][1] {
                count += 1
            } else {
                i += 1
            }
        }

        return count
    }
}
