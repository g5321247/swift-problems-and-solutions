//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(logn)
Space Complexity: O(1)
*/

class Solution {
    func bitwiseComplement(_ N: Int) -> Int {
        guard N > 0 else { return 1 }

        var n = N
        var mask = 1

        while n > 0 {
            n = n >> 1
            mask = mask << 1
        }

        /* 這邊 - 1 是因為他會多一位
        101 的 mask 會變成 1000，減 1 會變成 111
        */
        mask -= 1
        return mask ^ N
    }
}
