//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Recursion
// Time Complexity: O(N)
// Space Complexity: O(N)

//func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
//    guard let head = head else { return nil }
//    head.next = removeElements(head.next, val)
//    return head.val == val ? head.next : head
//}

// Iteration
// Time Complexity: O(N)
// Space Complexity: O(1)
func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    var curr = head

    while curr != nil {
        let next = curr?.next
        if next?.val == val {
            curr?.next = next?.next
        } else {
            curr = next
        }
    }

    return head?.val == val ? head?.next : head
}
