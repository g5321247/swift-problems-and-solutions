//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Solution
Time Complexity: O(N)
Space Complexity: O(1)

約瑟夫環
思路透過回推去找出剩下的數字在原本的位置

ref:
https://leetcode-cn.com/problems/yuan-quan-zhong-zui-hou-sheng-xia-de-shu-zi-lcof/solution/javajie-jue-yue-se-fu-huan-wen-ti-gao-su-ni-wei-sh/
*/

class Solution {
    func findTheWinner(_ n: Int, _ k: Int) -> Int {
        guard n > 1 else { return n }
        var ans = 0

        for i in 2 ... n {
            ans = (ans + k) % i
        }

        return ans + 1
    }
}
