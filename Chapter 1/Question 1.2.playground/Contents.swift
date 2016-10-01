import UIKit

// Check Permutation: Given two strings,write a method to decide if one is a permutation of the
// other.

func checkPermutation( s1: String, s2: String ) -> Bool {
    var first: [Character : Character] = [:]
    var last: [Character : Character] = [:]
    for char in s1.characters {
        first[char] = char
    }
    for char in s2.characters {
        last[char] = char
    }
    return first == last
}

// Test Case:
checkPermutation(s1: "dogs", s2: "gdos")

