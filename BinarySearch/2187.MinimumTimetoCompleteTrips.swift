//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time complexity: O(nlogD) D = 10 的 14 次方
Space complexity: O(1)
*/

class Solution {
    func minimumTime(_ time: [Int], _ totalTrips: Int) -> Int {
        var minTime = 1

        // 最大的可能就是 time[i] = 10 的 7 次方 * totalTrips = 10 的 7 次方
        var maxTime = 100000000000000 //(1e14)

        while minTime < maxTime {
            let mid = minTime + (maxTime - minTime) / 2
            let res = numberOfTrip(time, mid)

            // 這邊不能用這個判斷式，因為有可能結果相等，但是還有更短的時間
            // eg： test case [5,10,10] 9 會回傳 27，但實際上 25 就可以達到
            // if res == totalTrips { return mid }

            if res >= totalTrips {
                maxTime = mid
            } else {
                minTime = mid + 1
            }
        }

        return minTime
    }

    func numberOfTrip(_ times: [Int], _ time: Int) -> Int {
        var totalTrips = 0

        for t in times {
            totalTrips += (time / t)
        }

        return totalTrips
    }
}
