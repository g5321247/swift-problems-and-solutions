//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(N)
Space Complexity: O(N)
*/

func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    /* 這題可以視為 01 包背問題
    要找出所有正數(S1)和 + 所有負數(S2)和 = target 的組合次數為答案
    S1 - S2 = target
    => S1 = target + S2
    => S1 + S1 = target + (S1 + S2)
    => 2 S1 = target + Sum
    => S1 = (target + Sum) / 2
    然後只要找出 S1 排列組合 = (target + Sum) / 2 即可
    */

    let sum = nums.reduce(0) { $0 + $1 }

    // 若 target 大於 sum，不管怎樣都不會得到 target。若 (target + sum) 無法整除，就無法拿到整數的 S1
    if target > sum || (target + sum) % 2 != 0 { return 0 }

    let sTarget = (target + sum) / 2
    var dp: [Int: Int] = [0: 1]

    // 算出所有數字組合可能的正集合
    for num in nums {
        var i = sTarget

        while i >= num {
            dp[i, default: 0] += dp[i - num, default: 0]
            i -= 1
        }
    }

    return dp[sTarget, default: 0]
}
