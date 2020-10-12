//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Solution 1
// Time Complexity: O(NlogN)
// Space Complexity: O(NlogN)

//func isBalanced(_ root: TreeNode?) -> Bool {
//    guard let root = root else { return true }
//    return abs(length(root.left) - length(root.right)) < 2 && isBalanced(root.right) && isBalanced(root.left)
//}
//
//func length(_ root: TreeNode?) -> Int {
//    guard let root = root else { return 0 }
//
//    return max(length(root.left), length(root.right)) + 1
//}

// Solution 2
// Time Complexity: O(N)
// Space Complexity: O(N)

func isBalanced(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }

    return length(root) != -1
}

func length(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }

    let left = length(root.left)
    let right = length(root.right)

    if abs(right - left) > 1 || left == -1 || right == -1 {
        return -1
    }

    return max(left, right) + 1
}

