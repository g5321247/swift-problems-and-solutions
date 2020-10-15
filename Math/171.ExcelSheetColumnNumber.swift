//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N)
// Space Complexity: O(1)

func titleToNumber(_ s: String) -> Int {
    let sArray = Array(s.utf8)
    var res = 0

    for ascii in sArray {
        let num = Int(ascii) - 64
        res = (res * 26) + num
    }

    return res
}
