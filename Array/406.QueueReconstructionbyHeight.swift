//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(N2)
// Space Complexity: O(N)

func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
    let people = people.sorted {
        if $0[0] == $1[0] { return $0[1] < $1[1] }
        return $0[0] > $1[0]
    }

    var results = [[Int]]()

    for p in people {
        results.insert(p, at: p[1])
    }

    return results
}
