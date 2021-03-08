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
*/

class Solution {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else { return [] }
        var result = [String]()
        var stack = [(node: TreeNode, str: String)]()
        stack.append((node: root, str: String(root.val)))


        while !stack.isEmpty {
            let (node, str) = stack.removeLast()

            if node.left == nil, node.right == nil {
                result.append(str)
            } else {
                let nextStr = str + "->"
                if let left = node.left {
                    stack.append((node: left, str: nextStr + String(left.val)))
                }

                if let right = node.right {
                    stack.append((node: right, str: nextStr + String(right.val)))
                }
            }

        }

        return result
    }
}
