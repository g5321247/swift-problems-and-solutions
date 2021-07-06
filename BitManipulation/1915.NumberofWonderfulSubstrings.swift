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

概念類似 1371.Find the Longest Substring Containing Vowels in Even Counts
先找出只出現偶數字母的區間後，看他區間裡面只出現一奇的情況
eg:
b c c b a
先看偶數的 mask bccba = 1，

(1)
無偶數
一奇數 sum = 1(加上 dict[b ^ b(0)] = 1)
b [2: 1]

(2)
無偶數
一奇數 sum = 2(加上 dict[bc ^ c(b)] = 1)
bc [6: 1]

(3)
有偶數 sum = 3(加上 dict[bcc(b)] = 1)
一奇數 sum = 4(加上 dict[b ^ b(0)] = 1)
bcc [2: 2]

(4)
有偶數 sum = 5(加上 dict[bccb(0)] = 1)
一奇數 sum = 8(加上 dict[bccb ^ b(bcc)] = 2, dict[bccb ^ c(bcb)] = 1)
bccb [0: 2]

(5)
無偶數
一奇數 sum = 10(加上 dict[bccba ^ a(bccb)] = 2)
*/

class Solution {
    func wonderfulSubstrings(_ word: String) -> Int {
        var mask = 0
        var dict: [Int: Int] = [0: 1]
        var usedChar = Set<Character>()
        var sum = 0

        for char in word {
            mask ^= 1 << Int(char.asciiValue! - Character("a").asciiValue!)
            usedChar.insert(char)
            sum += dict[mask, default: 0]

            for char in usedChar {
                let bit = 1 << Int(char.asciiValue! - Character("a").asciiValue!)
                sum += dict[mask ^ bit, default: 0]
            }

            dict[mask, default: 0] += 1
        }

        return sum
    }
}
