//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(N)
Space Complexity: O(1)
*/

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var maxNumOfTask = 0
    // 有多少個是最大數的 char
    var maxTasksCount = 0
    var dict: [Character: Int] = [:]

    for task in tasks {
        dict[task, default: 0] += 1

        if dict[task, default: 0] > maxNumOfTask {
            maxNumOfTask = dict[task, default: 0]
            maxTasksCount = 1
        } else if dict[task, default: 0] == maxNumOfTask {
            maxTasksCount += 1
        }
    }

    // 假如 A 是最頻繁的數字, 出現 3 次，n = 2，那排列應該為 A XX A XX A (XX 為Slot,他的數量為 A.count - 1)
    let numOfSlot = maxNumOfTask - 1

    // 若 n = 2，預設每個 Slot 內的空格為 2。但若最頻繁的數字有兩個一樣，那排列應該為 AB X AB X AB。所以空格會變為 1(n - (maxTasksCount - 1) 這邊 maxTasksCount - 1 是因為一開始第一個數字就放進去了，第二個數字才會開時填補空格)
    // 這邊空格可能會算到負數，當重覆的數量超過 n 時，如 n = 2, 但 ABCD 出現數字一樣時： ABCD ABCD ABCD，這時就不需要考慮冷卻問題，因為在這插入的數一定會冷卻
    let emptySlot = n - (maxTasksCount - 1)

    // 由於最頻繁的數都已經插入，剩下的數字就是可放入空格的數字
    let availableTask = tasks.count -  maxNumOfTask * maxTasksCount

    // 用計算出來剩下的空格，減去可放入空格的數字後，就會得到剩下沒放完的空格，這些就必須放 idle
    let idle = max(0, numOfSlot * emptySlot - availableTask)

    return tasks.count + idle
}

/*
Test case:
1A n = 0
1A n = 1
1A n = 2

2A n = 0
2A n = 1
2A n = 2

2A1B n = 0
2A1B n = 1
2A2B n = 1

3A3B1C n = 1
3A2B1C n = 2

3A3B3C n = 2

3A3B3C1D n = 1
*/
