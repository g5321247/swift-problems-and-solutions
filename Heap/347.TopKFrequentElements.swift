//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Bucket sort Solution
// Time Complexity: O(n)
// Space Complexity: O(n)

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var bucket: [[Int]] = Array(repeating: [Int](), count: nums.count)
        var res = [Int]()
        var dict: [Int: Int] = [:]

        for num in nums {
            dict[num, default: 0] += 1
        }

        for (key, val) in dict {
            var arr = bucket[val - 1]
            arr.append(key)
            bucket[val - 1] = arr
        }

        var k = k

        for arr in bucket.reversed() {
            for val in arr {
                res.append(val)
            }

            if res.count == k { break }
        }


        return res
    }
}

// Heap Solution
// Time Complexity: O(nlogk)
// Space Complexity: O(n)

//class Solution {
//    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
//        var dict: [Int: Int] = [:]
//        let minHeap: Heap<Num> = Heap { $0 < $1 }
//
//        for num in nums {
//            dict[num, default: 0] += 1
//        }
//
//        for (key, val) in dict {
//            minHeap.push(Num(count: val, val: key))
//            if minHeap.length > k {
//                minHeap.pop()
//            }
//        }
//
//        return minHeap.nodes.map { $0.val }
//    }
//}
//
//struct Num: Comparable {
//
//    let count: Int
//    let val: Int
//
//    static func < (lhs: Num, rhs: Num) -> Bool {
//        return lhs.count < rhs.count
//    }
//}
//
//class Heap<T: Comparable> {
//
//    typealias OrderCriteria = (T, T) -> Bool
//
//    private(set) var nodes: [T] = []
//    private let orderCriteria: OrderCriteria
//
//    init(sort: @escaping OrderCriteria) {
//        self.orderCriteria = sort
//    }
//
//    var length: Int { return nodes.count }
//
//    func peek() -> T? { return nodes.first }
//
//    func pop() -> T? {
//        guard !nodes.isEmpty else { return nil }
//        nodes.swapAt(0, nodes.count - 1)
//        let res = nodes.removeLast()
//        heapfyDown(i: 0)
//        return res
//    }
//
//    func push(_ val: T) {
//        nodes.append(val)
//        heapfyUp(i: nodes.count - 1)
//
//    }
//
//    private func heapfyDown(i: Int) {
//        guard i < nodes.count else { return }
//        let left = i * 2 + 1
//        let right = i * 2 + 2
//
//        var first = i
//
//        if left < nodes.count, orderCriteria(nodes[left], nodes[first]) {
//            first = left
//        }
//
//        if right < nodes.count, orderCriteria(nodes[right], nodes[first]) {
//            first = right
//        }
//
//        if i == first { return }
//        nodes.swapAt(i, first)
//        heapfyDown(i: first)
//    }
//
//    private func heapfyUp(i: Int) {
//        guard i > 0 else { return }
//        let indexOfParent = (i - 1) / 2
//
//        if orderCriteria(nodes[indexOfParent], nodes[i]) { return }
//        nodes.swapAt(i, indexOfParent)
//        heapfyUp(i: indexOfParent)
//    }
//}
