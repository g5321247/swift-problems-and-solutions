//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(1)
Space Complexity: O(n)
*/

class ListNode {
    var next: ListNode?
    var prev: ListNode?
    let key: Int
    var val: Int

    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}

class LRUCache {

    private var dict: [Int: ListNode] = [:]
    let capacity: Int
    let head: ListNode
    let tail: ListNode

    init(_ capacity: Int) {
        self.capacity = capacity
        head = ListNode(0, 0)
        tail = ListNode(0, 0)
        head.next = tail
        tail.prev = head
    }

    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            remove(key)
            insert(node)
            return node.val
        } else {
            return -1
        }
    }

    func put(_ key: Int, _ value: Int) {
        let node: ListNode

        if let _node = dict[key] {
            remove(key)
            _node.val = value
            node = _node
        } else {
            node = ListNode(key, value)

            if dict.keys.count >= capacity {
                remove(tail.prev!.key)
            }
        }

        insert(node)
    }

    private func remove(_ key: Int) {
        let node = dict[key]
        node?.prev?.next = node?.next
        node?.next?.prev = node?.prev
        dict[key] = nil
    }

    private func insert(_ node: ListNode) {
        node.next = head.next
        node.next?.prev = node
        head.next = node
        node.prev = head
        dict[node.key] = node
    }
}

/*
Test case

["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
[[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]

["LRUCache", "put", "get"]
[[1], [1, 1], [1]]

["LRUCache", "get", "get"]
[[2], [3], [1]]

["LRUCache", "put", "get", "put", "get", "get"]
[[1], [1, 1], [1], [2,3], [1], [2]]

["LRUCache", "put", "get", "put", "put", "put", "get", "put", "get", "put", "get"]
[[3], [1, 1], [2], [2, 3], [4,4], [5,5], [2], [6,6], [5], [5,1], [5]]

["LRUCache","put","get","put","get","get"]
[[1],[2,1],[2],[3,2],[2],[3]]
*/
