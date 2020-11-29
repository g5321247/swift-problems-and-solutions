//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N)
// Space Complexity: O(1)
func maxSubArray(_ nums: [Int]) -> Int {
    var maxSum = Int.min
    var currSum = 0

    for num in nums {
        currSum = max(currSum + num, num)
        maxSum = max(maxSum, currSum)
    }

    return maxSum
}

/*
test case
max sum
1. postive
[1,2,4,5,6,7]
[1,2,-4,5,6,-5,7]
2. negtive
[-204004040]
[-204004040,-1,-5]

*/
