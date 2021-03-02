//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Solution
// Time Complexity: O(n)
// Space Complexity: O(n)

class Solution {
    func calculate(_ s: String) -> Int {
        var signal = 1
        var stack = [1]
        var num = 0
        var result = 0

        for char in s {
            switch char {
                case "0" ... "9":
                    num = num * 10 + Int(String(char))!
                case "+", "-":
                    result += (num * signal)

                    // 透過此條件，可以將 () 裡面的值做轉換，1-(2-3), 指到 2 時會轉成 -2(因為 2 * -1), -3 變成 3
                    signal = stack.last! * (char == "+" ? 1 : -1)
                    num = 0

                case "(":
                    stack.append(signal)

                case ")":
                    stack.popLast()
                default:
                    break
            }
        }

        result += (signal * num)
        return result
    }
}
