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
Iteration
*/

class Solution {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else { return 0 }
        var stack = [(root, [0: 1], root.val)]
        var count = 0

        while !stack.isEmpty {
            var (node, prefixSums, prefixSum) = stack.removeLast()
            count += prefixSums[prefixSum - sum, default: 0]
            prefixSums[prefixSum, default: 0] += 1

            if let right = node.right {
                stack.append((right, prefixSums, prefixSum + right.val))
            }

            if let left = node.left {
                stack.append((left, prefixSum: prefixSums, prefixSum + left.val))
            }
        }

        return count
    }
}

/*
Time Complexity: O(N)
Space Complexity: O(N)
Recursive
*/

class Solution1 {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        return pathSum(root, sum, 0, [0: 1])
    }

    func pathSum(_ root: TreeNode?, _ sum: Int, _ prefixSum: Int, _ prev: [Int: Int]) -> Int {
        guard let root = root else { return 0 }
        let nextPrefixSum = prefixSum + root.val
        var count = prev[nextPrefixSum - sum, default: 0]
        var prev = prev
        prev[nextPrefixSum, default: 0] += 1

        return count + pathSum(root.left, sum, nextPrefixSum, prev) + pathSum(root.right, sum, nextPrefixSum, prev)
    }
}
