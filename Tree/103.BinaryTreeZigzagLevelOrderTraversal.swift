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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var isRightToLeft = false
        var queue = [root]
        var result = [[Int]]()

        while !queue.isEmpty {
            var size = queue.count
            var nodes: [Int] = []

            for _ in 0 ..< size {
                let node = queue.removeFirst()

                if isRightToLeft {
                    nodes.insert(node.val, at: 0)
                } else {
                    nodes.append(node.val)
                }

                if let left = node.left {
                    queue.append(left)
                }

                if let right = node.right {
                    queue.append(right)
                }
            }

            result.append(nodes)
            isRightToLeft.toggle()
        }

        return result
    }
}
