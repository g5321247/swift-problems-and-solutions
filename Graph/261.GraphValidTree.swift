//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
DFS
Time Complexity: O(N + E)
Space Complexity: O(N)
*/

class Solution {
    var visit: Set<Int> = []

    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        var nodes: [[Int]] = Array(repeating: [], count: n)

        for edge in edges {
            nodes[edge[0]].append(edge[1])
            nodes[edge[1]].append(edge[0])
        }

        let res = validTree(nodes, prev: -1, curr: 0) && visit.count == n
        return res
    }

    func validTree(_ nodes: [[Int]], prev: Int, curr: Int) -> Bool {
        if visit.contains(curr) { return false }
        visit.insert(curr)

        for i in nodes[curr].indices {
            if nodes[curr][i] == prev { continue }

            if !validTree(nodes, prev: curr, curr: nodes[curr][i]) {
                return false
            }
        }

        return true
    }
}

/*
Union Find
Time Complexity: O(N)
Space Complexity: O(N)
*/

class Solution {

    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        guard edges.count == n - 1 else { return false }

        let unionFind = UnionFind(n)

        for edge in edges {
           if !unionFind.union(edge[0], edge[1]) { return false }
        }

        return true
    }
}

class UnionFind {
    var root: [Int] = []

    init(_ n: Int) {
        for i in 0 ..< n {
            root.append(i)
        }
    }

    func find(_ node: Int) -> Int {
        var node = node
        while node != root[node] {
            node = root[node]
        }

        return node
    }

    func union(_ a: Int, _ b: Int) -> Bool {
        let rootA = find(a)
        let rootB = find(b)

        if rootA == rootB { return false }
        // 這邊的概念要看 Disjoint Set
        // https://hackmd.io/@CLKO/rkRVS_o-4?type=view
        root[rootA] = rootB

        return true
    }
}

/*
[[1,3], [2,3]]
*/
