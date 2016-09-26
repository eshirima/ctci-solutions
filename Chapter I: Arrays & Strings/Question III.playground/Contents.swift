// Question: Write a method to replace all spaces in a string with '%20  You may assume that the string has suf cient space at the end to hold the additional characters,and that you are given the "true" length of the string. (Note: If implementing in Java,please use a character array so that you can perform this operation in place.)

import UIKit

extension String
{
    // Change to array of strings
    // Remove whitespaces
    // Join the array by adding %20
    mutating func URLify()
    {
        var stringArray = self.components(separatedBy: " ")
        var numberOfElements = stringArray.count - 1
        
        for index in (0...numberOfElements).reversed()
        {
            if stringArray[index] == ""
            {
                stringArray.remove(at: index)
                numberOfElements -= 1
            }
            else
            {
                break
            }
        }
        self = stringArray.joined(separator: "%20")
    }
}

var temp = "Mr John Smith   "
temp.URLify()