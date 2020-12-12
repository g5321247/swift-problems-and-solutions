//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N)
// Space Complexity: O(1)
func middleNode(_ head: ListNode?) -> ListNode? {
    var fast = head
    var slow = head

    while fast != nil, fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }

    return slow
}
