//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

class Solution {
    func trap(_ height: [Int]) -> Int {
        var l = 0
        var r = height.count - 1
        var maxL = 0
        var maxR = 0
        var water = 0

        while l <= r {
            if maxL < maxR {
                maxL = max(maxL, height[l])
                water += maxL - height[l]
                l += 1
            } else {
                maxR = max(maxR, height[r])
                water += maxR - height[r]
                r -= 1
            }
        }

        return water
    }
}

/*
Test case
[]
[1]
[1,3]
[3,1]
[0,1,3]
[3,0,1]
[1,3,0]
[0,1,0,2,1,0,1,3,2,1,2,1]
[4,2,0,3,2,5]
[3,2,1,4,2,1,0,5,1,2]
*/
