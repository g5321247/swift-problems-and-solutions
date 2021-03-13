//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(N)
Space Complexity: O(h)
*/

class Solution {
    func isValidSequence(_ root: TreeNode?, _ arr: [Int]) -> Bool {
        return isValidSequence(root, arr, level: 0)
    }

    func isValidSequence(_ root: TreeNode?, _ arr: [Int], level: Int) -> Bool {
        guard let root = root else { return false }
        if level >= arr.count || arr[level] != root.val { return false }

        if root.left == nil, root.right == nil, level == arr.count - 1 { return true }

        return isValidSequence(root.left, arr, level: level + 1) || isValidSequence(root.right, arr, level: level + 1)
    }
}
