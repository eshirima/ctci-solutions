/* Question:  Implement a method to perform basic string compression using the counts of repeated characters. For example, the string aabcccccaaa would become a2blc5a3. If the "compressed" string would not become smaller than the original string, your method should return
    the original string. You can assume the string has only uppercase and lowercase letters (a - z) */

import UIKit


extension String
{
    subscript (location: Int)-> Character
    {
        return self[self.index(self.startIndex, offsetBy: location)]
    }
    
    func compress()-> String
    {
        var occurence: Int = 1
        var compressedLength: Int = 0
        var compressedString: String = ""
        let originalLength: Int = self.characters.count
        var currentCharacter: Character = self[self.startIndex]
        
        for i in 1..<originalLength
        {
            if self[i] == currentCharacter
            {
                occurence += 1
            }
            else
            {
                compressedString.append(String(currentCharacter) + String(occurence))
                currentCharacter = self[i]
                occurence = 1
                compressedLength += 2
            }
        }
        
        compressedString.append(String(currentCharacter) + String(occurence))
        compressedLength += 2
        
        return compressedLength > originalLength ? self : compressedString
    }
}

print("aabcccccaaa".compress())
print("XbWZiGbirS".compress())
print("zzdNJsWzyQ".compress())
print("jjkHHHHXe".compress())

//temp.compress()
//temp1.compress()
