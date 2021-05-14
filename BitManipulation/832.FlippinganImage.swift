//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(n^2)
Space Complexity: O(1)
*/

class Solution {
    func flipAndInvertImage(_ image: [[Int]]) -> [[Int]] {
        var images = image

        for i in images.indices {
            for j in 0 ..< (images[i].count + 1) / 2 {
                images[i][j] ^= 1
                images[i].swapAt(j, images[i].count - j - 1)

                if j != images[i].count - j - 1 {
                    images[i][j] ^= 1
                }
            }
        }

        return images
    }
}
