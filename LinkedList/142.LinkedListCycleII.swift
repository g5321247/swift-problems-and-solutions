//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N)
// Space Complexity: O(1)
func detectCycle(_ head: ListNode?) -> ListNode? {
    var fast = head
    var slow = head

    while fast != nil {
        fast = fast?.next?.next
        slow = slow?.next

        if fast === slow {
            return findCycleStart(head, slow)
        }
    }

    return nil
}

func findCycleStart(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1
    var l2 = l2

    while l1 !== l2 {
        l1 = l1?.next
        l2 = l2?.next
    }

    return l1
}
/*
test case
# false
empty array [] - 1
single [1] -1
normal [1,2,3] -1

# true
single [1] 0
first index [4,6,8] 0
middle
odd [7,6,5,4,10] 3
even
[1,5,3,2] 2
[1,5,3,2] 3
last
[1,5,3] 2
*/
