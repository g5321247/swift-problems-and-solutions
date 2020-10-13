//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N)
// Space Complexity: O(1)

func convertToTitle(_ n: Int) -> String {
    guard n > 0 else { return "" }
    var n = n
    var result = ""

    while n > 0 {
        n -= 1
        let s = String(UnicodeScalar(UInt8(n % 26 + 65)))
        n /= 26
        result = s + result
    }

    return result
}
