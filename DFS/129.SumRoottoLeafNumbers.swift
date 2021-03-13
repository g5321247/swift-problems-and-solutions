//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(N)
Space Complexity: O(H)
*/

class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var sum = 0
        var stack = [(node: root, num: root.val)]

        while !stack.isEmpty {
            let (node, num) = stack.removeLast()

            if node.left == nil, node.right == nil {
                sum += num
            }

            if let left = node.left {
                stack.append((left, num * 10 + left.val))
            }

            if let right = node.right {
                stack.append((right, num * 10 + right.val))
            }
        }

        return sum
    }
}
