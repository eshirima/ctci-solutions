//: Playground - noun: a place where people can play

import UIKit


// Question 1.1:
// Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?

func isUnique(S : String) -> Bool {

    var uniqueChars: [Character : Character] = [:]
    for char in .characters {
        if (uniqueChars[char] == nil) {
            uniqueChars[char] = char
        } else {
            return false
        }
    }
    return true
}

// Test Case
isUnique(S: "Tes")
isUnique(S: "TesT")
