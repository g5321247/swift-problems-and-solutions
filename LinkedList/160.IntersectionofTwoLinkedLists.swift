//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation


// Time Complexity: O(N+M)
// Space Complexity: O(1)

func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    var nodeA = headA
    var nodeB = headB

    while nodeA !== nodeB {
        nodeA = nodeA == nil ? headB : nodeA?.next
        nodeB = nodeB == nil ? headA : nodeB?.next
    }

    return nodeA
}
