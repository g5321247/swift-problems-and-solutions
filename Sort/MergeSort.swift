//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

func mergeSort(arr: [Int]) -> [Int] {
    guard arr.count > 1 else {
        // 切記！這邊是回傳 arr，而不是 empty array([])
        return arr
    }
    var res: [Int] = []

    // 直接取一半就好
    let mid = arr.count / 2

    // Divide
    let leftArr: [Int] = mergeSort(arr: Array(arr[0 ..< mid]))
    let rightArr: [Int] = mergeSort(arr: Array(arr[mid ..< arr.count]))

    // Merge
    var l = 0
    var r = 0

    while l < leftArr.count, r < rightArr.count {
        if leftArr[l] > rightArr[r]{
            res.append(rightArr[r])
            r += 1
        } else {
            res.append(leftArr[l])
            l += 1
        }
    }

    while l < leftArr.count {
        res.append(leftArr[l])
        l += 1
    }

    while r < rightArr.count {
        res.append(rightArr[r])
        r += 1
    }

    return res
}
