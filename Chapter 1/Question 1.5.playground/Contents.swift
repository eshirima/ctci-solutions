//: Playground - noun: a place where people can play

import UIKit

//One Away: There are three types of edits that can be performed on strings: insert a character, remove a character, or replace a character. Given two strings, write a function to check if they are one edit (or zero edits) away.
//EXAMPLE
//pale, ple -> true pales, pale -> true pale, bale -> true pale, bake -> false Hints:#23, #97, #130

func oneAway( s1: String, s2: String ) -> Bool {
    // Check to see if they are at least one away
    if (s1.characters.count >= s2.characters.count) {
        var flag = false
        // only if s2 is smaller then s1
        for c in s2.characters {
            if (!s1.contains(String(c))) {
                if (flag) {
                    return false
                } else {
                    flag = !flag
                }
            }
        }
        // s1 is bigger so it contains s2
        return ((s1.characters.count - s2.characters.count) <= 1)
    } else {
        var flag = false;
        // only if s1 is smaller then s2
        for c in s1.characters {
            if (!s2.contains(String(c))) {
                if (flag) {
                    return false
                } else {
                    flag = !flag
                }
            }
        }
        // s2 is bigger so it contains s1
        return s2.contains(s1) && ((s2.characters.count - s1.characters.count) <= 1)
    }
}

oneAway(s1: "pale", s2: "pale")
