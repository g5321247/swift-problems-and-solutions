//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Recursion
// Time Complexity: O(3^M * 4^N)
// Space Complexity: O(3^M * 4^N)
class Solution {
        let dict: [Character: String] = [
            "2":"abc",
            "3":"def",
            "4":"ghi",
            "5":"jkl",
            "6":"mno",
            "7":"pqrs",
            "8":"tuv",
            "9":"wxyz",
        ]

    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }
        let digitsArray = Array(digits)



        return letterCombinations(digitsArray, index: 0, s: "")
    }

    func letterCombinations(_ digits: [Character], index: Int, s: String) -> [String] {
        guard index < digits.count else { return [s] }
        let letters = dict[digits[index]]!
        var result = [String]()

        for letter in letters {
            let res = letterCombinations(digits, index: index + 1, s: s + "\(letter)")
            result.append(contentsOf: res)
        }

        return result
    }
}

// Iteration
// Time Complexity: O(3^M * 4^N)
// Space Complexity: O(3^M * 4^N)

//class Solution {
//        let dict: [Character: String] = [
//            "2":"abc",
//            "3":"def",
//            "4":"ghi",
//            "5":"jkl",
//            "6":"mno",
//            "7":"pqrs",
//            "8":"tuv",
//            "9":"wxyz",
//        ]
//
//    func letterCombinations(_ digits: String) -> [String] {
//        guard !digits.isEmpty else { return [] }
//        var queue: [String] = [""]
//
//        for digit in digits {
//            let letters = dict[digit]!
//            let i = queue.count
//
//            for _ in 0 ..< i {
//                let res = queue.removeFirst()
//
//                for letter in letters {
//                    queue.append(res + String(letter))
//                }
//            }
//
//        }
//
//        return queue
//    }
//}

/*
Test case
""
"5"
"23"
"467"
"8952"
*/
