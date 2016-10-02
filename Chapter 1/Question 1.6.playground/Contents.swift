//: Playground - noun: a place where people can play

import UIKit

//String Compression: Implement a method to perform basic string compression using the counts of repeated characters. For example, the string aabcccccaaa would become a2blc5a3. If the "compressed" string would not become smaller than the original string, your method should return
//the original string. You can assume the string has only uppercase and lowercase letters (a - z).
//Hints:#92, #110

func stringCompression( s: String ) -> String {
    var nBuilder: String = ""
    var count = 0
    for (index, _) in s.characters.enumerated() {
        // Look at last char
        if (index == (s.characters.count - 1)) {
            if ( (s[s.index(s.startIndex, offsetBy: (index - 1))] ==
                s[s.index(s.startIndex, offsetBy: index)]) ) { // Chars are the same
                count += 1
                nBuilder.append(s[s.index(s.startIndex, offsetBy: index)])
                nBuilder.append(String(count))
            }
        }
        if ( (count > 0) &&
            (s[s.index(s.startIndex, offsetBy: (index - 1))] !=
                s[s.index(s.startIndex, offsetBy: index )])) {
            nBuilder.append(s[s.index(s.startIndex, offsetBy: (index - 1))])
            // Append char count
            nBuilder.append(String(count))
            count = 0
        }
        count += 1
    }
    return nBuilder.characters.count > s.characters.count ? s : nBuilder
}

// Test Case:
stringCompression(s: "aabcccccaaa")
stringCompression(s: "zzdNJsWzyQ")
