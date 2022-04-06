//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

class Solution {
    func alienOrder(_ words: [String]) -> String {

        let words = words.map { Array($0) }
        var chars: Set<Character> = []
        var graph: [Character: [Character]] = [:]
        var ranks: [Character: Int] = [:]

        for word in words {
            for char in word {
                chars.insert(char)
            }
        }

        // build graph
        var prev = Array("")

        for (i, word) in words.enumerated() {
            let minLength = min(word.count, prev.count)

            for j in word.indices {
                if j >= prev.count { break }
                if j + 1 == minLength, word[j] == prev[j], prev.count > word.count {
                    return ""
                }

                if word[j] != prev[j] {
                    graph[prev[j], default: []].append(word[j])
                    ranks[word[j], default: 0] += 1
                    break
                }
            }
            prev = word
        }

        // bfs
        var queue: [Character] = []
        var res = ""

        for char in chars {
            if ranks[char, default: 0] == 0 { queue.append(char) }
        }

        while !queue.isEmpty {
            let char = queue.removeFirst()
            res.append(char)

            for neighbor in graph[char, default: []] {
                ranks[neighbor, default: 0] -= 1
                if ranks[neighbor, default: 0] == 0 {
                    queue.append(neighbor)
                }
            }
        }

        if res.count != chars.count { return "" }

        return res
    }
}

/*
["abd","abc","abcd"]
["z","z"]
["a","b"]

*/
