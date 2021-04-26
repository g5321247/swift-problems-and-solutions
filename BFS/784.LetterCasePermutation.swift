//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time complexity: O(n * 2^N)
Space complexity: O(n * 2^N)
*/

class Solution {
    func letterCasePermutation(_ S: String) -> [String] {
        guard !S.isEmpty else { return [] }
        var res: [String] = [""]

        for char in S {
            var count = res.count
            let char = String(char)

            while count > 0 {
                let s = res.removeFirst()

                if char >= "A", char <= "z" {
                    res.append(s + char.lowercased())
                    res.append(s + char.uppercased())
                } else {
                    res.append(s + char)
                }


                count -= 1
            }

        }

        return res
    }
}
