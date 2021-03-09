//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(n)
// Space Complexity: O(n)
class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict: [Int: Int] = [:]
        var result = [Int]()

        for num in nums1 {
            dict[num] = num
        }

        for num in nums2 {
            if let val = dict[num] {
                dict[num] = nil
                result.append(num)
            }
        }

        return result
    }
}

/*
Follow up:
Given a sorted array, sovle with Time Complexity O(n) and Space Complexity O(1)(the resulting array of intersections is not taken into consideration)

Time Complexity: O(n)
Space Complexity: O(1)
*/
class Solution1 {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let nums1 = nums1.sorted { $0 < $1 }
        let nums2 = nums2.sorted { $0 < $1 }
        var result = [Int]()
        var n1 = 0
        var n2 = 0

        while n1 < nums1.count, n2 < nums2.count {
            if nums1[n1] > nums2[n2] {
                n2 += 1
            } else if nums1[n1] < nums2[n2] {
                n1 += 1
            } else {
                if nums1[n1] != result.last {
                    result.append(nums1[n1])
                }
                n1 += 1
                n2 += 1
            }
        }

        return result
    }
}

/*
[1,2,2,1]
[2,2]
[1,2,3,4,5]
[9,10,11]
[2,2,3,4,5,5,7,2]
[2,3,3,3,2]
[]
[1,3]
[5,6,7]
[]
*/
