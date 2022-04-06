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

class Codec {
    func encode(_ strs: [String]) -> String {
        var res = ""

        for str in strs {
            res += "\(str.count)" + "/" + str
        }

        return res
    }

    func decode(_ s: String) -> [String] {
        var res: [String] = []
        let s = Array(s)
        var i = 0
        var length = 0
        var preNum = -1

        while i < s.count {
            if preNum != -1, s[i] == "/" {
                let str = length == 0 ? "" : String(s[i + 1 ... i + length])
                res.append(str)
                i += length

                length = 0
                preNum = -1
            } else if let val = Int(String(s[i])) {
                preNum = length
                length = 10 * length + val
            }

            i += 1
        }

        return res
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * val s = obj.encode(strs)
 * let ans = obj.decode(s)

["123/","","Hello"]
*/
