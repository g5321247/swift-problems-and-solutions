//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(n)
// Space Complexity: O(1)
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var sum = nums.count * (nums.count + 1) / 2

        for num in nums {
            sum -= num
        }

        return sum
    }
}

/*
[0]
[1]
[0,1]
[3,0,1]
[9,6,4,2,3,5,7,0,1]
*/
