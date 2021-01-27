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
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        var curr: ListNode? = head
        var dummy = ListNode(0)
        var prev: ListNode? = dummy
        var count = 1

        while curr != nil {
            if count == m {
                curr = reverse(curr, length: n - m)
            }

            prev?.next = curr
            prev = curr
            curr = curr?.next

            count += 1
        }


        return dummy.next
    }

    func reverse(_ head: ListNode?, length: Int) -> ListNode? {
        var curr = head
        var prev: ListNode?
        var next: ListNode?

        for _ in stride(from: length, through: 0, by: -1) {
            next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }

        head?.next = curr

        return prev
    }
}
/*
[1,2,3,4,5],
2,
4,
[1,2,3,4,5],
1,
4,
[1,2,3,4,5],
2,
5,
[1,2,3,4,5],
1,
5,
[1],
1
1
*/
