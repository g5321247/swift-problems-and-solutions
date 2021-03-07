//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Solution
Time Complexity: O(N)
Space Complexity: O(N)
*/

class Solution {
    func countBits(_ num: Int) -> [Int] {
        guard num > 0 else { return [0] }
        var result = [0]

        for i in 1 ... num {
            /* 這邊 i / 2 的原因在於，
            3 = 110, 6(3的兩倍) = 110 0、7(3 的兩倍 + 1) = 110 1
            所以是 3 進一位後看餘數要不要加一(3 << 1)
            這題答案也可寫成
            result.append(result[i >> 1] + i % 2)
            */
            result.append(result[i / 2] + i % 2)
        }

        return result
    }
}
