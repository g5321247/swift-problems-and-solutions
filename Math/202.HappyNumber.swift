//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(logn)
時間複雜度分析：

根据我们的探索，我们猜测会有以下三种可能。

1.最终会得到 11。
2.最终会进入循环。
3.值会越来越大，最后接近无穷大。（不會發生，看下面詳解）

 | Digits | Largest        | Next    |
 | -----  | -------------- | ------- |
 |   1    |  9             |  81     |
 |   2    |  99            |  162    |
 |   3    |  999           |  243    |
 |   4    |  9999          |  324    |
 |   13   |  9999999999999 |  1053   |

 对于 3 位数的数字，它不可能大于243。这意味着它要么被困在 243 以下的循环内，要么跌到 1。
 4 位或 4 位以上的数字在每一步都会丢失一位，直到降到 3 位为止。
 所以我们知道，最坏的情况下，算法可能会在 243 以下的所有数字上循环，然后回到它已经到过的一个循环或者回到 1。但它不会无限期地进行下去，所以我们排除第三种选择。

 - 查找给定数字的下一个值的成本为 O(logn)，因为我们正在处理数字中的每位数字，而数字中的位数由 logn 给定。
 - 时间复杂度：O(243 * 3 + log n + loglog n + logloglog n) = O(logn)。
 - 要计算出总的时间复杂度，我们需要仔细考虑循环中有多少个数字，它们有多大。
 1. 一旦数字低于 243，它就不可能回到 243 以上。因此，我们就可以用 243 以下最长循环的长度来代替 243，不过，因为常数无论如何都无关紧要。
 2. 对于高于 243 的 n，我们需要考虑循环中每个数高于 243 的成本。通过数学运算，我们可以证明在最坏的情况下，这些成本将是 O(logn)+O(loglogn)+O(logloglogn)...。O(logn) 是占主导地位的部分，而其他部分相比之下都很小（总的来说，它们的总和小于 logn），所以我们可以忽略它们。

ref:
https://leetcode-cn.com/problems/happy-number/solution/kuai-le-shu-by-leetcode-solution/
来源：力扣（LeetCode）

Space Complexity: O(1)
*/

func isHappy(_ n: Int) -> Bool {
    var fast = n
    var slow = n

    repeat {
        fast = helper(fast)
        fast = helper(fast)
        slow = helper(slow)
    } while slow != fast

    return fast == 1
}

func helper(_ n: Int) -> Int {
    var n = n
    var result = 0

    while n > 0 {
        result += (n % 10) * (n % 10)
        n /= 10
    }

    return result
}

/*
Test case
0
1
2
5
7
10
19
59

cycle number
12

*/
