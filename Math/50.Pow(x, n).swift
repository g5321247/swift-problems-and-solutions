//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(logN)
// Space Complexity: O(1)

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var result: Double = 1
        var pow = abs(n)
        var x = x

        while pow > 0 {
            if pow % 2 != 0 {
                pow -= 1
                result *= x
            } else {
                pow /= 2
                x *= x
            }
        }

        return n >= 0 ? result : (1 / result)
    }
}
