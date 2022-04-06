//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

class Solution {
    var res: [String] = []

    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let root = TrieNode()

        for word in words {
            var curr = root

            for char in word {
                if let node = curr.dict[char] {
                    curr = node
                } else {
                    let node = TrieNode()
                    curr.dict[char] = node
                    curr = node
                }
            }
            curr.word = word
        }

        for i in board.indices {
            for j in board[i].indices {
                findWords(board, i, j, root)
            }
        }

        return res
    }

    func findWords(_ board: [[Character]], _ n: Int, _ m: Int, _ node: TrieNode) {
        guard n >= 0, n < board.count, m >= 0, m < board[n].count, let nextNode = node.dict[board[n][m]] else { return }

        if !nextNode.word.isEmpty {
            res.append(nextNode.word)
            nextNode.word = ""
        }

        var board = board
        let tmp = board[n][m]
        board[n][m] = "#"
        findWords(board, n + 1, m, nextNode)
        findWords(board, n - 1, m, nextNode)
        findWords(board, n, m + 1, nextNode)
        findWords(board, n, m - 1, nextNode)

        board[n][m] = tmp
    }
}

class TrieNode {
    var word = ""
    var dict: [Character: TrieNode] = [:]
}
