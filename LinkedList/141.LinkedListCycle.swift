//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N)
// Space Complexity: O(1)
func hasCycle(_ head: ListNode?) -> Bool {

    var slow = head
    var fast = head?.next

    while fast != nil {
        if fast === slow {
            return true
        } else {
            fast = fast?.next?.next
            slow = slow?.next
        }
    }

    return false
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
