//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Solution
Time Complexity: O(N)
Space Complexity: O(N)
*/

/*
思路：https://juejin.cn/post/7055460518160498725
*/

class Solution {
    func maxRunTime(_ n: Int, _ batteries: [Int]) -> Int {
        let batteries = batteries.sorted { $0 > $1 }
        var n = n
        var sum = batteries.reduce(0) { $0 + $1 }

        for battery in batteries {
            if battery <= sum / n { break }

            n -= 1
            sum -= battery
        }

        return sum / n
    }
}
