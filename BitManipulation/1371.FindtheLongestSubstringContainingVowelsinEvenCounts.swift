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

將 aeiou 視為二進位的五個數字 00000，當出現奇數次時，對應的數字就變為 1，偶數次時變為 0
eg:
a = 00001 ae = 00011 aea = 00010

將第一次出現的數字結果記下，之後若再次出現同樣數字時，兩個字之間的間距就代表之間間隔多少個 00000(prefix sum equal K)

例如 allla

alll = 00001 llla = 00001
a(00001) lll a(00001) = a(00001) 0...0 a(00001)
=> 這邊兩個數中間的間隔一定為 0，不然不會出現一樣的數字

兩個數字的間隔為 i - j + 1，開頭第一個為 00000 的話，必須也 + 1，所以 00000 的起始是 -1，這樣相減起來就是加一

ref:
https://www.youtube.com/watch?v=wXzRdvQaOAc&t=203s
*/

class Solution {
    func findTheLongestSubstring(_ s: String) -> Int {
        let strArray = Array(s)
        var dict: [Character: Int] = ["a": 2, "e": 4, "i": 8, "o": 16, "u": 32]
        var prefix: [Int: Int] = [0: -1]
        var curr = 0
        var maxLength = 0

        for (i, char) in strArray.enumerated() {
            curr ^= dict[char, default: 0]

            if let index = prefix[curr] {
               maxLength = max(maxLength, i - index)
            } else {
                prefix[curr] = i
            }
        }

        return maxLength
    }
}
