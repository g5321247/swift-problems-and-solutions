//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(1)
Space Complexity: O(1)
*/

class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        return n & (n - 1) == 0
    }
}

/*
0
1
2
3
4
6
8
10
9
-16
-1
*/
