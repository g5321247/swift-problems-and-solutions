//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(N)
Space Complexity: O(N)
Top Down
*/

//class Solution {
//    func numDecodings(_ s: String) -> Int {
//        let sArray = Array(s)
//        var dp: [Int: Int] = [:]
//        return numDecodings(sArray, dp: &dp, 0)
//    }
//
//    func numDecodings(_ s: [Character], dp: inout [Int: Int], _ index: Int) -> Int {
//        guard index < s.count else { return 1 }
//        if let sum = dp[index] { return sum }
//
//        var sum = 0
//
//            if Int("\(s[index])")! > 0 {
//                sum += numDecodings(s, dp: &dp, index + 1)
//            }
//
//            if index < s.count - 1, Int("\(s[index])")! > 0, Int("\(s[index])\(s[index + 1])")! < 27 {
//                sum += numDecodings(s, dp: &dp, index + 2)
//            }
//        dp[index] = sum
//        return sum
//    }
//}

/*
Time Complexity: O(N)
Space Complexity: O(N)
Bottom Up
*/

//class Solution {
//    func numDecodings(_ s: String) -> Int {
//        var dp: [Int] = [1]
//        let sArray = Array(s)
//
//        dp.append(sArray[0] == "0" ? 0 : 1)
//
//        for i in 1 ..< sArray.count {
//            var sum = 0
//            if sArray[i] != "0" { sum += dp[i] }
//
//            if "\(sArray[i - 1])\(sArray[i])" >= "10", "\(sArray[i - 1])\(sArray[i])" < "27" {
//                sum += dp[i - 1]
//            }
//
//            dp.append(sum)
//        }
//
//        return dp.last!
//    }
//}

/*
Time Complexity: O(N)
Space Complexity: O(1)
Bottom Up wtihout memerization
*/

class Solution {
    func numDecodings(_ s: String) -> Int {
        let sArray = Array(s)
        var oneDigit = sArray[0] == "0" ? 0 : 1
        var twoDigit = 1

        for i in 1 ..< sArray.count {
            var sum = 0
            if sArray[i] != "0" { sum += oneDigit }

            if "\(sArray[i - 1])\(sArray[i])" >= "10", "\(sArray[i - 1])\(sArray[i])" < "27" {
                sum += twoDigit
            }

            twoDigit = oneDigit
            oneDigit = sum
        }

        return oneDigit
    }
}

/*
"12"
"1"
"01"
"1321"
"13017"
"0"
"134"
"1472615"
"0518"
*/
