//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(n * 2^n)
// Space Complexity: O(n * 2^n)
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = [[]]

        for num in nums {
            for result in results {
                results.append(result + [num])
            }
        }

        return results
    }
}
