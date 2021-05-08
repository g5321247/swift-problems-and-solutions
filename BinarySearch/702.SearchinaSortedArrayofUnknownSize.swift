//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time complexity: O(logT)
T = target
The boundaries are 2^k .. 2^(k + 1) and 2^k < T < 2^(k + 1)
That means one needs k = logT steps to setup the boundaries, that means O(logT) time complexity.
Space complexity: O(1)
*/

class Solution {
    func search(_ reader: ArrayReader, _ target: Int) -> Int {
        if reader.get(0) == target { return 0 }
        var l = 0
        var r = 1

        // find the boundary
        while reader.get(r) < target {
            l = r
            r *= 2
        }

        // binary search
        while l <= r {
            let mid = l + (r - l) / 2
            if reader.get(mid) == target {
                return mid
            } else if reader.get(mid) > target {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }

        return -1
    }
}
