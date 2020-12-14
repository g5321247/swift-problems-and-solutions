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
    func isPalindrome(_ head: ListNode?) -> Bool {
        var fast = head
        var slow = head
        var prev: ListNode?

        while fast != nil, fast?.next != nil {
            fast = fast?.next?.next
            let tmp = slow
            slow = slow?.next
            tmp?.next = prev
            prev = tmp
        }

        if fast != nil { slow = slow?.next }

        while slow != nil {
            if slow?.val != prev?.val { return false }
            slow = slow?.next
            prev = prev?.next
        }

        return true
    }
}

/*
test case
nil
1
1,2
1,2,1
1,2,3
1,2,2,1
1,2,1,2
3,3
3,4,2,3
3,4,5,2,3
1,2,3,4,5,4,3,2,1
*/
