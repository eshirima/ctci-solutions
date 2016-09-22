// Question: Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?

import UIKit

extension String
{
    func hasUniqueCharactersUsingHashMap()-> Bool
    {
        var alphabets: [Character:Int] = [:]
        
        for character in self.characters
        {
            if alphabets[character] == 1
            {
                return false
            }
            else
            {
                alphabets[character] = 1
            }
        }
        
        return true
    }
    
    func hasUniqueCharactersUsingSet()-> Bool
    {
        var characterSet: Set<Character> = []
        
        for character in self.characters
        {
            if characterSet.contains(character)
            {
                return false
            }
            else
            {
                characterSet.insert(character)
            }
        }
        
        return true
    }
    
    func hasUniqueCharactersUsingSort()-> Bool
    {
        let sortedList = self.characters.sorted()
        
        for i in 0..<sortedList.count
        {
            if i == sortedList.count - 1
            {
                break
            }
            else if sortedList[i] == sortedList[i + 1]
            {
                return false
            }
        }
        
        return true
    }
}

// TEST CASES

"WN2MPzcgPU".hasUniqueCharactersUsingSet() // false
"J4jsRsAqiy".hasUniqueCharactersUsingSet() // false
"xb2goCApOk".hasUniqueCharactersUsingSet() // true
"qBaBjKbJer".hasUniqueCharactersUsingSet() // false
"sUSVxol5L6".hasUniqueCharactersUsingSet() // true
"V98frnSVZU".hasUniqueCharactersUsingSet() // false
"6ggOdUDYcd".hasUniqueCharactersUsingSet() // false
"ebKB4EO9Dt".hasUniqueCharactersUsingSet() // true
"gofh2Z9ghG".hasUniqueCharactersUsingSet() // false
"oCj2mOOLN5".hasUniqueCharactersUsingSet() // false

"WN2MPzcgPU".hasUniqueCharactersUsingSort() // false
"J4jsRsAqiy".hasUniqueCharactersUsingSort() // false
"xb2goCApOk".hasUniqueCharactersUsingSort() // true
"qBaBjKbJer".hasUniqueCharactersUsingSort() // false
"sUSVxol5L6".hasUniqueCharactersUsingSort() // true
"V98frnSVZU".hasUniqueCharactersUsingSort() // false
"6ggOdUDYcd".hasUniqueCharactersUsingSort() // false
"ebKB4EO9Dt".hasUniqueCharactersUsingSort() // true
"gofh2Z9ghG".hasUniqueCharactersUsingSort() // false
"oCj2mOOLN5".hasUniqueCharactersUsingSort() // false

"WN2MPzcgPU".hasUniqueCharactersUsingHashMap() // false
"J4jsRsAqiy".hasUniqueCharactersUsingHashMap() // false
"xb2goCApOk".hasUniqueCharactersUsingHashMap() // true
"qBaBjKbJer".hasUniqueCharactersUsingHashMap() // false
"sUSVxol5L6".hasUniqueCharactersUsingHashMap() // true
"V98frnSVZU".hasUniqueCharactersUsingHashMap() // false
"6ggOdUDYcd".hasUniqueCharactersUsingHashMap() // false
"ebKB4EO9Dt".hasUniqueCharactersUsingHashMap() // true
"gofh2Z9ghG".hasUniqueCharactersUsingHashMap() // false
"oCj2mOOLN5".hasUniqueCharactersUsingHashMap() // false