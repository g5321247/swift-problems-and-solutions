//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

// Time Complexity: O(NML^4)
// Space Complexity: O(MN)
class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let word = Array(word)
        var board = board

        for i in 0 ..< board.count {
            for j in 0 ..< board[0].count {
               if search(&board, word, row: i, column: j, index: 0) {
                   return true
               }
            }
        }

        return false
    }

    func search(_ board: inout [[Character]], _ word: [Character], row: Int, column: Int, index: Int) -> Bool {
        guard row < board.count, row >= 0 else { return false }
        guard column < board[0].count, column >= 0 else { return false }
        guard board[row][column] == word[index] else { return false }
        // 被探尋過了
        guard board[row][column] != "0" else { return false }
        if index == word.count - 1 { return true }
        // print(row, column, board.count, board[0].count)


        let curr = board[row][column]
        // 透過給 0 的方式紀錄被探尋，這樣就不用用額外的空間紀錄有沒有探尋過
        board[row][column] = "0"

        let isFound = search(&board, word, row: row + 1, column: column, index: index + 1) || search(&board, word, row: row - 1, column: column, index: index + 1) || search(&board, word, row: row, column: column + 1, index: index + 1) || search(&board, word, row: row, column: column - 1, index: index + 1)

        board[row][column] = curr

        return isFound
    }
}

/* test case
[["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
"ABCCED"
[["A","B","C"]]
"ABC"
[["A","B","C","A"]]
"ABCB"
[["A"], ["B"], ["C"]]
"CBA"
*/
