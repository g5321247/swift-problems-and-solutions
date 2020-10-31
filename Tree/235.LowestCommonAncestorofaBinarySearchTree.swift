//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let pVal = p?.val, let qVal = q?.val else { return nil }
    var curr = root

    while let val = curr?.val {
        if val > pVal, val > qVal {
            curr = curr?.left
        } else if val < pVal, val < qVal {
            curr = curr?.right
        } else {
            return curr
        }
    }

    return nil
}
