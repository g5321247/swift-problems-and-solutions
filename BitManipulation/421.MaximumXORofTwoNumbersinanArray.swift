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

 這題要用 Greedy 從最大位數去找，看看 Xor 的值存不存在。
 eg:
 a = 11001
 b = 00101

 先從第五位開始對，為了避免被其他位數干擾，先把他們都變成 0
 這邊就要用個 mask 去移除干擾

 mask 為 10000
 mask & a = 1----(- 為 0)
 mask & b = 0----

 接著把兩個值放入哈希表，用預期當前最大數 Xor 另一個數，看數存不存在；存在的話，表示預期存在，此數成立
 eg:
 若前次預期最大位數為 10100，接下來要判斷第二位
 10100 變為 10110，進行判斷，若 Xor 其他數後的值，存在哈希表中，表示此數存在；
 存在變為 10110，不存在變為 10100
 最後跑完後就可以找出最大數

 ref: https://www.youtube.com/watch?v=r8BAp3lFZ48&t=1117s&ab_channel=%E5%B1%B1%E6%99%AF%E5%9F%8E%E4%B8%80%E5%A7%90
 */


class Solution {
    func findMaximumXOR(_ nums: [Int]) -> Int {
        var maxVal = 0
        var mask = 0
        var maxResult = 0

        for num in nums {
            maxVal = max(maxVal, num)
        }

        let length = String(maxVal, radix: 2).count - 1

        for i in stride(from: length, through: 0, by: -1) {
            mask = mask | (1 << i)
            var set: Set<Int> = []

            for num in nums {
                set.insert(mask & num)
            }

            let tmp = maxResult | 1 << i

            for prefix in set {
                if set.contains(prefix ^ tmp) {
                    maxResult = tmp
                    break
                }
            }
        }

        return maxResult
    }
}
