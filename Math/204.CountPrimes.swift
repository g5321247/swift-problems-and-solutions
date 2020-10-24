//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Tip:
厄拉托西尼篩法
ref:
 https://zh.wikipedia.org/wiki/%E5%9F%83%E6%8B%89%E6%89%98%E6%96%AF%E7%89%B9%E5%B0%BC%E7%AD%9B%E6%B3%95*/
/*
Solution
Time Complexity: O(N log log n)
Space Complexity: O(N)

*/

func countPrimes(_ n: Int) -> Int {
    guard n > 1 else { return 0 }
    var count = 0
    var isPrimes: [Bool] = Array(repeating: true, count: n)
    isPrimes[0] = false
    isPrimes[1] = false

    for i in 2 ..< n {
        if isPrimes[i] {
            var j = i * i

            while j < n {
                isPrimes[j] = false
                j += i
            }
            count += 1
        }
    }

    return count
}
