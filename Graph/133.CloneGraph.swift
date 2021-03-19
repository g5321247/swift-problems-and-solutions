//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
N 為有幾個點, M 為有幾條線
Time Complexity: O(N + M)
Space Complexity: O(N)
*/

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else { return nil }
        var dict: [Int: Node] = [node.val: Node(node.val)]
        var stack: [Node] = [node]

        while !stack.isEmpty {
            let currNode = stack.removeLast()
            let cpNode = dict[currNode.val]

            for neighbor in currNode.neighbors {
                guard let neighbor = neighbor else { continue }
                if let cpNeighbor = dict[neighbor.val] {
                    cpNode?.neighbors.append(cpNeighbor)
                } else {
                    let cpNeighbor = Node(neighbor.val)
                    cpNode?.neighbors.append(cpNeighbor)
                    dict[neighbor.val] = cpNeighbor
                    stack.append(neighbor)
                }
            }
        }

        return dict[node.val]
    }
}
