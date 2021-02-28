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
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        guard let root = root else { return [] }

        return pathSum(root, targetSum, arr: [])
    }

    func pathSum(_ root: TreeNode, _ targetSum: Int, arr: [Int]) -> [[Int]] {
        var arr = arr
        var result = [[Int]]()
        arr.append(root.val)

        if root.left == nil, root.right == nil {
            return targetSum == root.val ? [arr] : []
        }

        if let left = root.left {
            result.append(contentsOf: pathSum(left, targetSum - root.val, arr: arr))
        }

        if let right = root.right {
            result.append(contentsOf: pathSum(right, targetSum - root.val, arr: arr))
        }

        return result
    }
}
/*
Iteration
Time complexity: O(n)
Space complexity: O(n)
*/

class Solution2 {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        guard let root = root else { return [] }
        var stack = [Path(node: root, targetSum: targetSum, arr: [])]
        var result: [[Int]] = []

        while !stack.isEmpty {
            var path = stack.removeLast()
            path.arr.append(path.node.val)

            if path.node.left == nil, path.node.right == nil, path.node.val == path.targetSum {
                result.append(path.arr)
            }

            if let left = path.node.left {
                stack.append(Path(node: left, targetSum: path.targetSum - path.node.val, arr: path.arr))
            }

            if let right = path.node.right {
                stack.append(Path(node: right, targetSum: path.targetSum - path.node.val, arr: path.arr))
            }
        }

        return result
    }
}

struct Path {
    let node: TreeNode
    let targetSum: Int
    var arr: [Int]
}
/* Test case
[5,4,8,11,null,13,4,7,2,null,null,5,1]
22
[1,2,3,4]
3
*/
