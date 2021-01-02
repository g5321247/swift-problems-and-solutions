//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(nlogn)
// Space Complexity: O(n)
class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        guard intervals.count > 1 else { return true }
        let intervals = intervals.sorted { $0[0] < $1[0] }

        for i in 1 ..< intervals.count {
            if intervals[i][0] < intervals[i - 1][1] { return false }
        }

        return true
    }
}

/*
Test case
// false
[3,5],[2,4],[1,3]
[0,5],[0,10]

// true
[3,5],[0,1],[5,7]
[]
[1,3]
*/
