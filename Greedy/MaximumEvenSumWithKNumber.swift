//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(nlogn)
Space Complexity: O(n)
*/

/*
 Given an array of integers A and an integer K, find a subsequence of length K that maximize the sum, which must be even. Return the sum, or -1 if no even sum can be made.

 Examples:
 A = [4,2,6,7,8], K = 3, the algorithm should return 18 as 4 + 6 + 8 = 18
 A = [5, 5, 2, 4, 3], K = 3, the algorithm should return 14 as 5 + 5 + 4 = 14

解題思路：
分 odds max heap 和 evens max heap, k 跑 while loop, 若 k == 1 或 even val 大於 odd val 時，將 even val pop 出來並加進去；若不是的話就比對最大和次大 odd val 與 even val 的總和，
若 odd 總和大於 even，就把 odd 總和加進去，k -= 2；若小於 even，將最大的 even 加進去(因為次大的 even + 第三大的 even 可能會比最大和次大 odd val 小)， k -= 1
 */

class Solution {
    func maximumEvenSumWithKNumber(_ arr: [Int], _ k: Int) -> Int {
        guard k > 0, arr.count > k else { return 0 }
        var odds = [Int]()
        var evens = [Int]()
        var sum = 0

        for num in arr {
            num & 1 == 0 ? evens.append(num) : odds.append(num)
        }

        odds.sort()
        evens.sort()
        var k = k

        while k > 0 {
            if k == 1 || (evens.last ?? 0) > (odds.last ?? Int.min) {
                sum += evens.removeLast()
                k -= 1
            } else {
                let maxOdd = (odds.popLast() ?? Int.min)
                let secondMaxOdd = (odds.popLast() ?? Int.min)
                let maxEven = (evens.popLast() ?? 0)
                let secondMaxEven = (evens.popLast() ?? 0)

                if (maxOdd + secondMaxOdd) >= (maxEven + secondMaxEven) {
                    sum += maxOdd + secondMaxOdd
                    evens.append(contentsOf: [secondMaxEven, maxEven])
                    k -= 2
                } else {
                    sum += maxEven
                    evens.append(secondMaxEven)
                    odds.append(contentsOf: [secondMaxOdd, maxOdd])
                    k -= 1
                }
            }
        }

        return sum
    }
}


let solution = Solution()

solution.maximumEvenSumWithKNumber([4,2,6,7,8], 3)
solution.maximumEvenSumWithKNumber([5, 5, 2, 4, 3], 3)
solution.maximumEvenSumWithKNumber([13, 10, 8, 8, 1, 1], 3)
