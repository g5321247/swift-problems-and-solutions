//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time complexity: O(n)
Space complexity: O(n)
*/

class Solution {
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }

        var queue = [root]
        var result = [Int]()

        while !queue.isEmpty {
            var maxNum = Int.min

            for _ in 0 ..< queue.count {
                let node = queue.removeFirst()
                maxNum = max(maxNum, node.val)

                if let left = node.left {
                    queue.append(left)
                }

                if let right = node.right {
                    queue.append(right)
                }
            }

            result.append(maxNum)
        }

        return result
    }
}
