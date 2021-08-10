//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time complexity:
init: O(nlogn) update: O(logn) query: O(logn)
Space complexity: O(n)
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
