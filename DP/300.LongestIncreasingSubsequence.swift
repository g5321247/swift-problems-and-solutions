//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
DP solution
Time Complexity: O(N^2)
Space Complexity: O(N)
*/

// Bottom-up
class Solution {

    func lengthOfLIS(_ nums: [Int]) -> Int {
        var memo: [Int: Int] = [:]
        var count = 0

        for i in nums.indices.reversed() {
            for j in i ..< nums.count {
                if nums[i] < nums[j] {
                    memo[i] = max(memo[i, default: 1], memo[j, default: 1] + 1)
                }
            }
            count = max(count, memo[i, default: 1])
        }

        return count
    }

}

/*
講解： https://www.youtube.com/watch?v=l2rCz7skAlk
Patience sort solution
Time Complexity: O(N^2)
Space Complexity: O(N)
*/

class Solution {

    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp: [Int] = []

        for num in nums {
            if let last = dp.last, last >= num {
                dp[binarySearch(dp, num)] = num
            } else {
                dp.append(num)
            }
            // print(dp)
        }

        return dp.count
    }

    func binarySearch(_ arr: [Int], _ num: Int) -> Int {
        var l = 0
        var r = arr.count - 1

        while l < r {
            let mid = l + (r - l) / 2
            if num == arr[mid] {
                return mid
            } else if num > arr[mid] {
                l = mid + 1
            } else {
                r = mid
            }
        }

        return l
    }

}
