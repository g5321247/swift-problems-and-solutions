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
    func reorderList(_ head: ListNode?) {
        var fast = head
        var slow = head

        while fast != nil, fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }

        if fast != nil {
            slow = slow?.next
        }

        let reversedNode = reverse(slow)
        merge(head, reversedNode)
    }

    func reverse(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var curr = head

        while curr != nil {
            let tmp = curr
            curr = curr?.next
            tmp?.next = prev
            prev = tmp
        }

        return prev
    }

    func merge(_ node1: ListNode?, _ node2: ListNode?) {
        var node1 = node1
        var node2 = node2

        // 最後一次自己的指針必須指向 nil，不然會無窮指會自己
        while node1 != nil {
            let tmp = node1?.next
            node1?.next = node2
            node1 = node2
            node2 = tmp
        }
    }
}

/*
nil
1
1,2
1,2,3
1,2,3,4
1,2,3,4,5
6,5,4,2,1,3
5,7,4,2,1,8,9
*/
