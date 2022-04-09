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
*/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var res: [String] = []
        var stack: [TreeNode?] = [root]

        while !stack.isEmpty {
            let node = stack.removeLast()

            if let node = node {
                res.append("\(node.val)")
                stack.append(node.right)
                stack.append(node.left)
            } else {
                res.append("null")
            }
        }

        return res.joined(separator: ",")
    }

    func deserialize(_ data: String) -> TreeNode? {
        let data = data.components(separatedBy: ",").map { Int($0) }
        var i = 0

        return helper(data, &i)
    }

    func helper(_ data: [Int?], _ i: inout Int) -> TreeNode? {
        guard i < data.count, let val = data[i] else { return nil }
        var node: TreeNode = TreeNode(val)

        i += 1
        node.left = helper(data, &i)
        i += 1
        node.right = helper(data, &i)

        return node
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))

/*
全部只有右子樹
數字很大[1,2345,null]
相同數ㄗ [1,2,3,2,1]
*/
