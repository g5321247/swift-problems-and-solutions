//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
G(n) 代表樹的總和
F(i, n) i 為 root node
G(n) = F(1, n) + F(2, n) + F(3, n) + ... + F(n, n)

由於
F(i, n)(以 i 為 root node) = G(i - 1)(左子樹的排列組合) * G(n - i)(右子樹的排列組合)
=>
G(n) = G(0) * G(n - 1) + G(1) * G(n - 2) + ..... + G(n - 1) * G(0)

Time Complexity: O(N2)
Space Complexity: O(N)
*/

func numTrees(_ n: Int) -> Int {
    guard n > 1 else { return 1 }
    var dp = Array(repeating: 0, count: n + 1)
    dp[0] = 1
    dp[1] = 1

    for i in 2 ... n {
        for j in 1 ... i {
            dp[i] += dp[j - 1] * dp[i - j]
        }
    }

    return dp[n]
}

/*
Test case:
1
2
3
5
9
10
15
19
*/
