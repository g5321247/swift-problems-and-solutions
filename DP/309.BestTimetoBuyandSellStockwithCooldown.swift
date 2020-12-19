//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(N)
Space Complexity: O(1)
*/

// 用狀態機去紀錄
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard !prices.isEmpty else { return 0 }
        var reset = 0
        var hold = Int.min
        var sell = 0

        for price in prices {
            let preSell = sell
            sell = hold + price
            hold = max(hold, reset - price)
            reset = max(reset, preSell)
        }

        return max(reset, sell)
    }
}

/* test case
empty
[1]
[1,3]
[3,1]
reset bigger
[1,2,3,0,2]
sell bigger
[1,2,3,0,2]
*/
