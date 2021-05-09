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
    func singleNumber(_ nums: [Int]) -> [Int] {
        var mask = 0

        // 拿到 a 和 b 的 XOR
        nums.forEach { mask ^= $0 }

        /* 負數最後為 1 的位數後面都會和正數相同，前面都會相反）([0] 為正數，[1] 為負數)
        7 = [0]111
        -7 = [1]001
        10 = [0] 1010(最後一為第二位所以第二位以後都相同)
        -10 = [1]0110
        */

        /* 這邊是做個 mask，找出最後一位為 1 的數字
        10 & -10 = [0]0010
        在這個位數上 a 和 b 必不相同，才會使 XOR 變成 1
        0011 和 1001 的 XOR = 10[1]0(為[1]去做判斷)
        */
        mask &= -mask

        var res = [0, 0]

        nums.forEach {
            if mask & $0 == 0 {
                res[0] ^= $0
            } else {
                res[1] ^= $0
            }
        }

        return res
    }
}
