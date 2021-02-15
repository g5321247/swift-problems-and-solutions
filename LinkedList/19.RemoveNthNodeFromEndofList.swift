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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var start = ListNode(0)
        start.next = head
        var fast: ListNode? = start
        var slow: ListNode? = start

        for _ in 0 ... n {
            // 這邊要多走一步，因為 slow 必須停在要消掉的前一個 node
            fast = fast?.next
        }

        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }

        slow?.next = slow?.next?.next
        return start.next
    }
}

/*
[1,2,3,4,5]
2
[1]
1
[1,2,3,4,5]
1
[1,2,3,4,5]
5
*/
