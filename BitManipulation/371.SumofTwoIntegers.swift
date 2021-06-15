//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(1)
Space Complexity: O(1)

ref:
https://www.youtube.com/watch?v=qq64FrA2UXQ

主要有兩點
1. 不同時不必進位，取 XOR 即可
2. 相同時必須進位，取 & 進一位

例
7:    111
1:    001
---------
XOR   110(6)
&     010(001 進一位)(2)
---------
XOR   100(4)
&     100(010 進一位)(4)
---------
XOR   000(0)
&    1000(100 進一位)(8)
---------
XOR  1000(8)
&    0000(0000 進一位)(0)

負數也適用於這個規則
原因在於
32 bit 的數字，第一位表示正負，其餘 31 位才表示數字
(0)0000001 -> 1

負數為了讓操作方便， 為正 1的全相反 + 1
例如 -1 的 2 進位為
(1)1111111 -> -1 (正 1 的全相反為 0000000 + 1)

(0)00...11001 的全相反為
(1)11...00110 + 1

原因在於此兩個值相加時，會 overflow 進位後變回 0

*/

class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b

        while b != 0 {
            let answer = a ^ b
            let carry = (a & b) << 1
            a = answer
            b = carry
        }

        return a
    }
}
