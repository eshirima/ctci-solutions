//: Playground - noun: a place where people can play

import UIKit

//URLify : Write a method to replace all spaces in a string with '%20  You may assume that the string has suffcient space at the end to hold the additional characters,and that you are given the "true" length of the string. (Note: If implementing in Java,please use a character array so that you can perform this operation in place.)
//EXAMPLE
//Input: "Mr John Smith ", 13 Output: "Mr%20John%20Smith" Hints: #53, #118

func urlIfy( s: String) -> String {
    return s.replacingOccurrences(of: " ", with: "%20")
}

urlIfy(s: "Mr John Smith ")
