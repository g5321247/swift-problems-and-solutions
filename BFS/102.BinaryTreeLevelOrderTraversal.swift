//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Solution 1
// Time Complexity: O(N)
// Space Complexity: O(N)

//class Solution {
//    func levelOrder(_ root: TreeNode?) -> [[Int]] {
//        var res = [[Int]]()
//        levelOrder(root, level: 0, res: &res)
//        return res
//    }
//
//    func levelOrder(_ root: TreeNode?, level: Int, res: inout [[Int]]) {
//        guard let root = root else { return }
//        if level >= res.count {
//            res.append([root.val])
//        } else {
//            res[level].append(root.val)
//        }
//        levelOrder(root.left, level: level + 1, res: &res)
//        levelOrder(root.right, level: level + 1, res: &res)
//    }
//}

// Solution 2
// Time Complexity: O(N)
// Space Complexity: O(N)

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var queue = [root]
        var result = [[Int]]()

        while !queue.isEmpty {
            let numOfNode = queue.count
            var arr = [Int]()

            for _ in 0 ..< numOfNode {
                let node = queue.removeFirst()
                arr.append(node.val)

                if let left = node.left {
                    queue.append(left)
                }

                if let right = node.right {
                    queue.append(right)
                }
            }

            result.append(arr)
        }

        return result
    }
}

