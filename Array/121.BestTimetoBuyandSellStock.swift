//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N)
// Space Complexity: O(1)
func maxProfit(_ prices: [Int]) -> Int {
    guard !prices.isEmpty else { return 0 }

    var maxProfit = 0
    var currMin = Int.max

    for price in prices {

        maxProfit = max(maxProfit, price - currMin)

        currMin = min(currMin, price)
    }

    return maxProfit
}

/*
1. postive profit
(1) find min number before sell
[7,1,5,3,6,4]
(2) find min number but profix not maxium
[3,9,1,3,3,2,4]

2. negitive profit
[6,5,4,3,2,1]

3. corner case
[]
[1]

*/
