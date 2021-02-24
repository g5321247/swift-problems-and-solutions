//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Recursion
Time complexity: O(n)
Space complexity: O(n)
*/

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBST(root, min: Int.min, max: Int.max)
    }

    func isValidBST(_ root: TreeNode?, min: Int, max: Int) -> Bool {
        guard let root = root else { return true }
        if root.val <= min || root.val >= max { return false }

        return isValidBST(root.left, min: min, max: root.val) &&  isValidBST(root.right, min: root.val, max: max)
    }
}

/*
Iteration
Time complexity: O(n)
Space complexity: O(n)
*/
class Solution2 {
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        var stack = [(node: TreeNode, min: Int, max: Int)]()
        stack.append((node: root, min: Int.min, max: Int.max))

        while !stack.isEmpty {
            let (node, min, max) = stack.removeLast()

            if node.val >= max || node.val <= min { return false }

            if let right = node.right {
                stack.append((node: right, min: node.val, max: max))
            }

            if let left = node.left {
                stack.append((node: left, min: min, max: node.val))
            }

        }

        return true
    }
}
