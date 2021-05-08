//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(n)
Space Complexity: O(1)
*/

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var res = 0

        for num in nums {
            res ^= num
        }

        return res
    }
}
