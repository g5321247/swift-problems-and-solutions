//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Recursive
Time complexity: O(n)
Space complexity: O(n)
*/

class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        if root.left == nil, root.right == nil {
            return root.val == targetSum
        }

        return hasPathSum(root.left, targetSum - root.val) || hasPathSum(root.right, targetSum - root.val)
    }
}

/*
Iteration
Time complexity: O(n)
Space complexity: O(n)
*/

class Solution2 {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        var stack = [(root, targetSum)]

        while !stack.isEmpty {
            let node = stack.removeLast()

            if node.0.left == nil, node.0.right == nil, node.0.val == node.1  {
                return true
            }

            if let left = node.0.left { stack.append((left, node.1 - node.0.val)) }
            if let right = node.0.right { stack.append((right, node.1 - node.0.val)) }
        }

        return false
    }
}
/* Test case
[]
0
[1,2,3,4]
3
[5,4,8,11,null,13,4,7,2,null,null,null,1]
22
*/
