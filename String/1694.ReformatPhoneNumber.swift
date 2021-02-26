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
    func reformatNumber(_ number: String) -> String {
        // \D 在正規表示中代表省略所有非數字字元, 多加個 \是取消跳脫

        let num = number.replacingOccurrences(of: "\\D", with: "", options: .regularExpression)
        let numArray = Array(num)
        var res = ""
        var i = 0

        while i < numArray.count {
            if numArray.count - i > 4 {
                res += String(numArray[i ..< i + 3]) + "-"
                i += 3
            } else if numArray.count - i == 4 {
                res += String(numArray[i ..< i + 2]) + "-"
                i += 2
            } else {
                res += String(numArray[i ..< numArray.count])
                break
            }
        }

        return res
    }
}
