//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(NM)
Space Complexity: O(N)
N = Amount
M = number fo coins
*/


// Top-down
class Solution {
    var memo: [Int: Int] = [:]

    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 { return 0 }
        if amount < 0 { return -1 }

        if let val = memo[amount] { return val }
        var minVal = Int.max

        for coin in coins {
            let res = coinChange(coins, amount - coin)

            if res != -1 {
                minVal = min(minVal, res + 1)
            }
        }

        if minVal == Int.max { minVal = -1 }
        memo[amount] = minVal
        return memo[amount, default: -1]
    }
}

// Bottom-up
class Solution {
    // min(dp[i - 1][amount], dp[i][amount - count] + 1) -> min(dp[amount], dp[amount - count] + 1)

    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        let coins = coins.sorted()
        var dp = Array(repeating: Int.max - 1, count: amount + 1)
        dp[0] = 0

        for total in 1 ... amount {
            for coin in coins {
                if total < coin { break }
                dp[total] = min(dp[total], dp[total - coin] + 1)
            }
        }

        // Int.max - 1 是因為有可能 dp[total - coin] + 1 會溢位
        return dp[amount] == Int.max - 1 ? -1 : dp[amount]
    }
}

/*
[2, 6]
3
*/
