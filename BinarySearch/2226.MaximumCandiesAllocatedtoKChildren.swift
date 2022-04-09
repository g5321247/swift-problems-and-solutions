//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time complexity: O(nlogD) D = 10 的 7 次方
Space complexity: O(1)
*/

class Solution {
    func maximumCandies(_ candies: [Int], _ k: Int) -> Int {
        var l = 0
        var r = 10000000

        while l < r {
            let mid = (l + r + 1) / 2
            var sum = 0

            for candy in candies {
                sum += (candy / mid)
            }

            if k > sum {
                r = mid - 1
            } else {
                l = mid
            }
        }

        return l
    }
}

/*
[5,8,6]
3
[1,5,7,9]
4
*/
