//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Insertion sort
Time Complexity: O(n)
Space Complexity: O(n)
*/

class MedianFinder {

    var result = [Int]()
    /** initialize your data structure here. */
    init() {

    }

    func addNum(_ num: Int) {
        // insertion sort
        var index = result.count
        for i in result.indices {
            if result[i] > num {
                index = i
                break
            }
        }
        result.insert(num, at: index)
    }

    func findMedian() -> Double {
        let size = result.count
        if size % 2 == 0 {
            return Double(result[(size - 1) / 2] + result[size / 2]) / 2.0
        } else {
            return Double(result[(size - 1) / 2])
        }
    }
}


/*
 ["MedianFinder","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian"]
 [[],[3],[],[1],[],[5],[],[2],[],[7],[],[8],[],[1],[],[10],[]]
*/

/*
Two Heap
Time Complexity: O(logn)
Space Complexity: O(n)
*/

import CoreFoundation

class MedianFinder2 {
    let lo = CFBinaryHeap.max()
    let hi = CFBinaryHeap.min()

    func addNum(_ num: Int) {
        let pointer: UnsafeMutablePointer<Int> = .allocate(capacity: 1)
        pointer.initialize(to: num)

        CFBinaryHeapAddValue(lo, pointer)
        CFBinaryHeapAddValue(hi, CFBinaryHeapGetMinimum(lo))
        CFBinaryHeapRemoveMinimumValue(lo)

        if CFBinaryHeapGetCount(lo) < CFBinaryHeapGetCount(hi) {
            CFBinaryHeapAddValue(lo, CFBinaryHeapGetMinimum(hi))
            CFBinaryHeapRemoveMinimumValue(hi)
        }
    }

    func findMedian() -> Double {
        if CFBinaryHeapGetCount(lo) > CFBinaryHeapGetCount(hi) {
            return Double(CFBinaryHeapGetMinimum(lo).load(as: Int.self))
        } else {
            let loMax = CFBinaryHeapGetMinimum(lo).load(as: Int.self)
            let hiMin = CFBinaryHeapGetMinimum(hi).load(as: Int.self)
            return Double(loMax + hiMin) / 2
        }
    }
}

extension CFBinaryHeap {
    static func min() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = { lPtr, rPtr, _ in
            let (lhs, rhs) = (lPtr!.load(as: Int.self), rPtr!.load(as: Int.self))
            return lhs == rhs ? 0 : lhs > rhs ? 1 : -1
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }

    static func max() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = { lPtr, rPtr, _ in
            let (lhs, rhs) = (lPtr!.load(as: Int.self), rPtr!.load(as: Int.self))
            return lhs == rhs ? 0 : lhs > rhs ? -1 : 1
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}
