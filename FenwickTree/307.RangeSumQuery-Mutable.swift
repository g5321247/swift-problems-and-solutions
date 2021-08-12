//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Fenwick tree
Time complexity:
init: O(nlogn) update: O(logn) query: O(logn)
Space complexity: O(n)
連結：
https://www.youtube.com/watch?v=WbafSgetDDk&t=24s&ab_channel=HuaHua
*/

class NumArray {

    var tree: FenwickTree
    var nums: [Int]

    init(_ nums: [Int]) {
        self.nums = nums
        tree = FenwickTree(n: nums.count + 1)

        for (i, num) in nums.enumerated() {
            tree.update(i + 1, num)
        }
    }

    func update(_ index: Int, _ val: Int) {
        tree.update(index + 1, val - nums[index])
        nums[index] = val
    }

    func sumRange(_ left: Int, _ right: Int) -> Int {
        return tree.query(right + 1) - tree.query(left)
    }
}

class FenwickTree {

    var sums: [Int]

    init(n: Int) {
        sums = Array(repeating: 0, count: n + 1)
    }

    func update(_ index: Int, _ val: Int) {
        var i = index

        while i < sums.count {
            sums[i] += val
            i += lowBit(x: i)
        }

    }

    func query(_ index: Int) -> Int {
        var sum = 0
        var i = index

        while i > 0 {
            sum += sums[i]
            i -= lowBit(x: i)
        }

        return sum
    }

    private func lowBit(x: Int) -> Int { return (x & -x) }
}

/*
SegmentTree tree
Time complexity:
init: O(nlogn) update: O(logn) query: O(logn)
Space complexity: O(n)
連結:
https://www.youtube.com/watch?v=rYBtViWXYeI&t=1323s&ab_channel=HuaHua
*/

//class NumArray {
//
//    let tree: SegmentTree
//
//    init(_ nums: [Int]) {
//        tree = NumArray.makeTree(start: 0, end: nums.count - 1, arr: nums)
//    }
//
//    func update(_ index: Int, _ val: Int) {
//        update(index, val, node: tree)
//    }
//
//    func sumRange(_ left: Int, _ right: Int) -> Int {
//        return sumRange(left, right, tree)
//    }
//
//    private func sumRange(_ left: Int, _ right: Int, _ node: SegmentTree?) -> Int {
//        guard let node = node else { return 0 }
//
//        if node.start == left, node.end == right {
//            return node.val
//        }
//
//        let mid = (node.start + node.end) / 2
//
//        if mid > right {
//            return sumRange(left, right, node.left)
//        } else if mid < left {
//            return sumRange(left, right, node.right)
//        } else {
//            return sumRange(left, mid, node.left) + sumRange(mid + 1, right, node.right)
//        }
//    }
//
//    private func update(_ index: Int, _ val: Int, node: SegmentTree?) {
//        guard let node = node else { return }
//        if node.start == index, node.end == index {
//            node.val = val
//            return
//        }
//
//        let mid = (node.start + node.end) / 2
//
//        if index > mid {
//            update(index, val, node: node.right)
//        } else {
//            update(index, val, node: node.left)
//        }
//
//        node.val = (node.left?.val ?? 0) + (node.right?.val ?? 0)
//    }
//
//    private static func makeTree(start: Int, end: Int, arr: [Int]) -> SegmentTree {
//        if start == end { return SegmentTree(start: start, end: end, val: arr[start]) }
//        let mid = (start + end) / 2
//        let left = makeTree(start: start, end: mid, arr: arr)
//        let right = makeTree(start: mid + 1, end: end, arr: arr)
//
//        let node = SegmentTree(start: start, end: end, val: 0)
//        node.val = left.val + right.val
//        node.left = left
//        node.right = right
//
//        return node
//    }
//}
//
//class SegmentTree {
//    let start: Int
//    let end: Int
//    var val: Int
//
//    var left: SegmentTree?
//    var right: SegmentTree?
//
//    init(start: Int, end: Int, val: Int) {
//        self.start = start
//        self.end = end
//        self.val = val
//    }
//}

/*
["NumArray","sumRange","update","sumRange"]
[[[1,3,5,8,10]],[0,2],[1,2],[0,2]]
["NumArray","sumRange"]
[[[1,3,5,8,10]],[2,4]]
["NumArray","sumRange"]
[[[1,3,5,8,10]],[1,3]]
*/
