//: Playground - noun: a place where people can play

import UIKit

func isUnique(S : String) -> Bool {
    var uniqueChars: [Character: Character] = [:]
    for char in S.characters {
        if (uniqueChars[char] == nil) {
            uniqueChars[char] = char;
        } else {
            return false
        }
    }
    return true
}

isUnique(S: "TesT")
