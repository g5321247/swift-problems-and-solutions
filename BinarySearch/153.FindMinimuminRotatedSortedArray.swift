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
    func findMin(_ nums: [Int]) -> Int {
        var l = 0
        var r = nums.count - 1

        while l < r {
            if nums[l] < nums[r] {
                return nums[l]
            }

            let mid = l + (r - l) / 2

            if nums[mid] >= nums[l] {
                l = mid + 1
            } else {
                r = mid
            }
        }

        return nums[l]
    }
}

/*
[1,2,3]
[1]
[2,1]
[3,4,1,2]
*/
