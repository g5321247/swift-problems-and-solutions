//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time: O(n)
Space: O(1)
*/

class Solution {
    func duplicateZeros(_ arr: inout [Int]) {
        var zeros = arr.reduce(0) {
            return $0 + ($1 == 0 ? 1 : 0)
        }

        for i in arr.indices.reversed() {
            // 因為是由後往前數，當 i + zeros 小於 array size 時，表示當前的數字 shift 可以放進 array 裡，zeros 表示他要 shift 幾位
            if i + zeros < arr.count { arr[i + zeros] = arr[i] }

            if arr[i] == 0 {
                zeros -= 1
                // 假若當前數字是 0，且 i + zeros 小於 array size 時，必須複製一個 0 shift 過去
                if i + zeros < arr.count { arr[i + zeros] = 0 }
            }
        }
    }
}
