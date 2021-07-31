//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(NlogK)
// K is number of elements in Array, N is total Nodes
// Space Complexity: O(1)
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 1 else { return lists.first ?? nil }

        var l = mergeKLists(Array(lists[0 ..< lists.count/2]))
        var r = mergeKLists(Array(lists[lists.count/2 ..< lists.count]))

        return mergeList(l: l, r: r)
    }

    func mergeList(l: ListNode?, r: ListNode?) -> ListNode? {
        guard let l = l else { return r }
        guard let r = r else { return l }

        if l.val < r.val {
            l.next = mergeList(l: l.next, r: r)
            return l
        } else {
            r.next = mergeList(l: l, r: r.next)
            return r
        }
    }
}
