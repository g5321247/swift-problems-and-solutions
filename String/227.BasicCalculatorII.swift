//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Solution
// Time Complexity: O(n)
// Space Complexity: O(1)

class Solution {
    func calculate(_ s: String) -> Int {
        var currNum = 0
        var lastNum = 0
        var result = 0
        var signal = "+"
        let sArray = Array(s)

        for i in sArray.indices {
            let char = sArray[i]

            if let num = Int(String(char)) {
                currNum = currNum * 10 + num
            }

            if (!char.isNumber && char != " ") || i == sArray.count - 1 {
                switch signal {
                    case "+", "-":
                        result += lastNum
                        lastNum = currNum * (signal == "+" ? 1 : -1)
                        currNum = 0
                    case "*":
                        lastNum *= currNum
                        currNum = 0
                    case "/":
                        lastNum /= currNum
                        currNum = 0
                    default:
                        break
                }

                signal = String(char)
            }
        }

        result += lastNum

        return result
    }
}
