//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N)
// Space Complexity: O(1)
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var curr = head
        var prev: ListNode? = nil

        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }

        return prev
    }
}

// Time Complexity: O(N)
// Space Complexity: O(N)
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        return helper(head, prev: nil)
    }

    func helper(_ head: ListNode?, prev: ListNode?) -> ListNode? {
        if head == nil { return prev }
        let next = head?.next
        head?.next = prev

        return helper(next, prev: head)
    }
}
/*
nil
1
1,2
1,2,3
*/
