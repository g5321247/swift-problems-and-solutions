//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
BFS
Time complexity: O(n)
Space complexity: O(n)
*/

class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        var queue = [root]
        var level = 0

        while !queue.isEmpty {
            level += 1

            for _ in 0 ..< queue.count {
                let node = queue.removeFirst()
                if node.left == nil, node.right == nil { return level }

                if let left = node.left {
                    queue.append(left)
                }

                if let right = node.right {
                    queue.append(right)
                }
            }

        }

        return level
    }
}

/*
DFS
Time complexity: O(n)
Space complexity: O(n)
*/

class Solution2 {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        if root.left == nil { return minDepth(root.right) + 1 }
        if root.right == nil { return minDepth(root.left) + 1 }
        return min(minDepth(root.right) + 1, minDepth(root.left) + 1)
    }
}

/*
[]
[1]
[3,9,20,null,null,15,7]
[2,null,3,null,4,null,5,null,6]
[3,1,4,6,8,19,23]
*/
