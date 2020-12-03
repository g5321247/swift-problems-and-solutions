//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
Time Complexity: O(n)
Space Complexity: O(n)
*/

class TrieNode {
    var dict: [Character: TrieNode] = [:]
    var isEnd = false
}

class Trie {

    let root: TrieNode

    /** Initialize your data structure here. */
    init() {
        root = TrieNode()
    }

    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var node = root

        for char in word {
            if let next = node.dict[char] {
               node = next
            } else {
                let next = TrieNode()
                node.dict[char] = next
                node = next
            }
        }

        node.isEnd = true
    }

    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var node = root

        for char in word {
            if let next = node.dict[char] {
                node = next
            } else {
                return false
            }
        }

        return node.isEnd
    }

    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var node = root

        for char in prefix {
            if let next = node.dict[char] {
                node = next
            } else {
                return false
            }
        }

        return true
    }
}
