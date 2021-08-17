//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Solution
// Time Complexity: O(nlogn)
// Space Complexity: O(n)

class Solution {
    func connectSticks(_ sticks: [Int]) -> Int {
        let minHeap: Heap<Int> = Heap { $0 < $1 }
        var res = 0

        for stick in sticks { minHeap.push(stick) }

        while minHeap.nodes.count > 1 {
            let cost = minHeap.pop()! + minHeap.pop()!
            res += cost
            minHeap.push(cost)
        }

        return res
    }
}

class Heap<T: Comparable> {

    typealias OrderCriteria = (T, T) -> Bool

    private(set) var nodes: [T] = []
    private let orderCriteria: OrderCriteria

    init(sort: @escaping OrderCriteria) {
        self.orderCriteria = sort
    }

    var length: Int { return nodes.count }

    func peek() -> T? {
        return nodes.first
    }

    func pop() -> T? {
        guard !nodes.isEmpty else { return nil }
        nodes.swapAt(0, nodes.count - 1)
        let res = nodes.removeLast()
        heapfyDown(i: 0)
        return res
    }

    func push(_ val: T) {
        nodes.append(val)
        heapfyUp(i: nodes.count - 1)

    }

    private func heapfyDown(i: Int) {
        guard i < nodes.count else { return }
        let left = i * 2 + 1
        let right = i * 2 + 2

        var first = i

        if left < nodes.count, orderCriteria(nodes[left], nodes[first]) {
            first = left
        }

        if right < nodes.count, orderCriteria(nodes[right], nodes[first]) {
            first = right
        }

        if i == first { return }
        nodes.swapAt(i, first)
        heapfyDown(i: first)
    }

    private func heapfyUp(i: Int) {
        guard i > 0 else { return }
        let indexOfParent = (i - 1) / 2

        if orderCriteria(nodes[indexOfParent], nodes[i]) { return }
        nodes.swapAt(i, indexOfParent)
        heapfyUp(i: indexOfParent)
    }
}

