//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time: O(nlogn)
Space: O(1)
*/

class Solution {
    func kthLargestNumber(_ nums: [String], _ k: Int) -> String {
        return nums.sorted { $0.count == $1.count ? $0 > $1 : $0.count > $1.count }[k - 1]
    }
}
