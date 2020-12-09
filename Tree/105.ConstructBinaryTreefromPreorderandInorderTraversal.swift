//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time complexity: O(n)
Space complexity: O(n)

Solution Ref:
https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/solution/cong-qian-xu-yu-zhong-xu-bian-li-xu-lie-gou-zao-9/
*/

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    var dict: [Int: Int] = [:]

    for (i, num) in inorder.enumerated() {
        dict[num] = i
    }

    return buildTree(preorder, pStart: 0, pEnd: preorder.count - 1, iStart: 0, dict: dict)
}

func buildTree(_ preorder: [Int], pStart: Int, pEnd: Int, iStart: Int, dict: [Int: Int]) -> TreeNode? {
    if pStart > pEnd { return nil }
    guard let i = dict[preorder[pStart]] else { return nil }

    let node = TreeNode(preorder[pStart])
    node.left = buildTree(preorder, pStart: pStart + 1, pEnd: pStart + i - iStart, iStart: iStart, dict: dict)
    node.right = buildTree(preorder, pStart: pStart + i - iStart + 1, pEnd: pEnd, iStart: i + 1, dict: dict)

    return node
}
