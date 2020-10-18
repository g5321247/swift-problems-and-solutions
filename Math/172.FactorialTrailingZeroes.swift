//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
What about 100! then?
100/5 = 20, we have 20 numbers have factor 5: 5, 10, 15, 20, 25, …, 95, 100.

Is the number of trailing zero 20? No, it’s 24, why?
 Within that 20 numbers, we have 4 of them: 25 (5×5), 50 (2x5x5), 75 (3x5x5), 100 (4x5x5) that have an extra factor of 5.

ref: https://zxi.mytechroad.com/blog/math/leetcode-172-factorial-trailing-zeroes/
*/


/*
Solution 1
Time Complexity: O(log5 N)
Space Complexity: O(log5 N)

func trailingZeroes(_ n: Int) -> Int {
    if n == 0 { return 0 }
    return n / 5 + trailingZeroes(n / 5)
}
*/

/*
Solution 2
Time Complexity: O(log5 N)
Space Complexity: O(1)
*/

func trailingZeroes(_ n: Int) -> Int {
    var n = n
    var count = 0

    while n > 0 {
        n /= 5
        count += n
    }

    return count
}
