//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time complexity: O(logn)
Space complexity: O(1)
*/

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1

        while l <= r {
            let mid = (l + r) / 2

            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }

        return -1
    }
}

/*
[1] 1
[1] 0
[1,2] 2
[1,2] 1
[1,2] 0

*/
