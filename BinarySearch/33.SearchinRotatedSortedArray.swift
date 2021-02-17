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
            let mid = l + (r - l) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] >= nums[0] {
                if target >= nums[0],  target < nums[mid] {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            } else {
                if target <= nums.last!,  target > nums[mid] {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
        }

        return -1
    }
}

/*
[1,2,3,4,5,6,8,9]
3
[1,2,3,4,5,6,8,9]
14
[1]
1
[1]
-3
[4,5,6,7,0,1,2]
-5
[4,5,6,7,0,1,2]
0
[2,3,4,5,6,8,9,1]
3
[2,3,4,5,6,8,9,1]
-2
[3,1]
1
*/
