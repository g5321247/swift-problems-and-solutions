//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time complexity: O(max(n, m))
Space complexity: O(max(n, m))
*/

class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard let root = root else { return false }
        if isSame(root, subRoot) { return true }
        return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot)
    }

    func isSame(_ lhs: TreeNode?, _ rhs: TreeNode?) -> Bool {
        guard let l = lhs, let r = rhs else {
            return lhs?.val == rhs?.val
        }

        return l.val == r.val && isSame(l.left, r.left) && isSame(l.right, r.right)
    }
}
