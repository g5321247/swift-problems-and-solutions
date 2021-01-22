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
    func maxProduct(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var result = Int.min
        var currMax = 1
        var currMin = 1

        for num in nums {
            let tmpMax = currMax
            currMax = max(currMax * num, currMin * num)
            currMax = max(currMax, num)
            currMin = min(currMin * num, tmpMax * num)
            currMin = min(currMin, num)

            result = max(currMax, result)

        }

        return result
    }
}

/*
[]
[1]
[-1]
[1,2,3,5]
[2,3,-4,5,1]
[2,3,-4,-5,1]
[0, 2]
*/
