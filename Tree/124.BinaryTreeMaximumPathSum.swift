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
Space complexity: O(h) h = tree height
*/

class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var val = Int.min
        maxPathSum(root, maxVal: &val)
        return val
    }

    func maxPathSum(_ root: TreeNode?, maxVal: inout Int) -> Int {
        guard let root = root else { return 0 }

        let left = max(maxPathSum(root.left, maxVal: &maxVal), 0)
        let right = max(maxPathSum(root.right, maxVal: &maxVal), 0)
        maxVal = max(maxVal, left + right + root.val)

        return max(left, right) + root.val
    }
}
