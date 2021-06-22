//
//  209. Minimum Size Subarray Sum .swift
//  
//
//  Created by George Liu on 2020/10/11.
//

import Foundation

/*
A precedence rule is given as "P>E", which means that letter "P" is followed directly by the letter "E".
Write a function, given an array of precedence rules, that finds the word represented by the given rules.

Note: Each represented word contains a set of unique characters, i.e. the word does not contain duplicate letters.


Examples:

findWord(["P>E","E>R","R>U"]) // PERU

findWord(["I>N","A>I","P>A","S>P"]) // SPAIN


Test cases:

findWord(["U>N", "G>A", "R>Y", "H>U", "N>G", "A>R"]) // HUNGARY

findWord(["I>F", "W>I", "S>W", "F>T"]) // SWIFT

findWord(["R>T", "A>L", "P>O", "O>R", "G>A", "T>U", "U>G"]) // PORTUGAL

findWord(["W>I", "R>L", "T>Z", "Z>E", "S>W", "E>R", "L>A", "A>N", "N>D", "I>T"]) // SWITZERLAND


Time: O(n)
Space: O(n)
*/

class ListNode {
    let val: String
    var prev: ListNode?
    var next: ListNode?

    init(val: String) {
        self.val = val
    }
}

func findWord(_ strs: [String]) -> String {

    var dict: [String: ListNode] = [:]
    var res = ""

    for str in strs {
        let KeyOfBiggerNode = String(str.first!)
        let KeyOfSmallerNode = String(str.last!)
        let biggerNode = dict[KeyOfBiggerNode] ?? ListNode(val: KeyOfBiggerNode)
        let smallerNode = dict[KeyOfSmallerNode] ?? ListNode(val: KeyOfSmallerNode)

        biggerNode.next = smallerNode
        smallerNode.prev = biggerNode

        dict[KeyOfBiggerNode] = biggerNode
        dict[KeyOfSmallerNode] = smallerNode
    }


    var node = dict.values.first { $0.prev == nil }

    while let _node = node  {
        res += _node.val
        node = node?.next
    }

    return res
}


