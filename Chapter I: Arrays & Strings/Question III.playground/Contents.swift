// Question: Write a method to replace all spaces in a string with '%20  You may assume that the string has suf cient space at the end to hold the additional characters,and that you are given the "true" length of the string. (Note: If implementing in Java,please use a character array so that you can perform this operation in place.)

import UIKit

extension String
{
    // Change to array of strings
    // Remove whitespaces
    // Join the array by adding %20
    mutating func URLify()
    {
        if self.isEmpty
        {
            print("Cannot URLify an empty String")
            return
        }
        
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

func generateRandomString(ofLength length: Int)-> String
{
    // tailored to the question
    let characters: String = "a  bc  def  ghi  jkl  mno  pqrs  tuv  wx  yzA  BCDE  FGH  I JKL  MN  OP  QRS  TUV  W  XYZ  01  234  56  789"
    let charactersArray: [String] = characters.characters.map{String($0)}
    let count: Int = charactersArray.count
    
    var generatedString: String = String()
    
    for _ in 1...length
    {
        generatedString.append(charactersArray[Int(arc4random() % UInt32(count))])
    }
    
    return generatedString
}

var one = generateRandomString(ofLength: 1)
var two = generateRandomString(ofLength: 2)
var three = generateRandomString(ofLength: 3)
var four = generateRandomString(ofLength: 4)
var five = generateRandomString(ofLength: 5)
var six = generateRandomString(ofLength: 6)
var seven = generateRandomString(ofLength: 7)
var eight = generateRandomString(ofLength: 8)
var nine = generateRandomString(ofLength: 9)
var ten = generateRandomString(ofLength: 10)
var eleven = generateRandomString(ofLength: 11)
var twelve = generateRandomString(ofLength: 12)
var thirteen = generateRandomString(ofLength: 13)
var fourteen = generateRandomString(ofLength: 14)
var fifteen = generateRandomString(ofLength: 15)
var midRange = generateRandomString(ofLength: 20)
var exaggerated = generateRandomString(ofLength: 50)
var seriously = generateRandomString(ofLength: 200)

print(one) //L
print(two) //
print(three) //64X
print(four) //uG j
print(five) // 7 cER
print(six) // NT k
print(seven) //k c v t
print(eight) //A1Ij9eG
print(nine) //xE L9W D
print(ten) //AdK vQZ o8
print(eleven) // q    ksW O
print(twelve) // pJ L Uc  6h
print(thirteen) // dN9  U N U 1
print(fourteen) //8 A5  L l 8PG
print(fifteen) //VXdCGQ Up Ols
print(midRange) //  W 7  H27g c WI 5
print(exaggerated) //    Ny  x KaqZy  4 65M D  7r W7 u  MDC  a6 b    g
print(seriously) /*hFWJ VQR uG 3  XzDt   PH  3vi bD  OI    iE pF   s
bbG n B ls YN 2      uG jQ5f0 fw qER5uj  h  z  yC b7rRblA  f2z   nIX6   4 de d  dz   DQ g   Oe9 vE  yykhq N Du  X  i  i tFX    g DE   A dBo R  v   v 5Cx    X   MzH  08   W MX q9     6GQ N   pS F ZH Hl
 */

one.URLify()
two.URLify()
three.URLify()
fourteen.URLify()
five.URLify()
six.URLify()
seven.URLify()
eight.URLify()
nine.URLify()
ten.URLify()
eleven.URLify()
twelve.URLify()
thirteen.URLify()
fourteen.URLify()
fifteen.URLify()
midRange.URLify()
exaggerated.URLify()
seriously.URLify()

print(one) //L
print(two) //
print(three) //uG j *****
print(four) //7%20cER
print(five) //%20NT%20k
print(six) //k%20c%20v%20t
print(seven) //%20A1Ij9eG
print(eight) //xE%20L9W%20D
print(nine) //AdK%20vQZ%20o8
print(ten) //%20q%20%20%20%20ksW%20O
print(eleven) //%20pJ%20L%20Uc%20%206h
print(twelve) //%20dN9%20%20U%20N%20U%201
print(thirteen) //8%20A5%20%20L%20l%208PG
print(fourteen) //VXdCGQ%20Up%20Ols
print(fifteen) //%20%20W%207%20%20H27g%20c%20WI%205
print(midRange) //%20%20%20%20Ny%20%20x%20KaqZy%20%204%2065M%20D%20%207r
print(exaggerated) //%20W7%20u%20%20MDC%20%20a6%20b%20%20%20%20g
print(seriously) /*%20hFWJ%20VQR%20uG%203%20%20XzDt%20%20%20PH%20%203vi%20bD%20%20OI%20%20%20%20iE%20pF%20%20%20s
 bbG%20n%20B%20ls%20YN%202%20%20%20%20%20%20uG%20jQ5f0%20fw%20qER5uj%20%20h%20%20z%20%20yC%20b7rRblA%20%20f2z%20%20%20nIX6%20%20%204%20de%20d%20%20dz%20%20%20DQ%20g%20%20%20Oe9%20vE%20%20yykhq%20N%20Du%20%20X%20%20i%20%20i%20tFX%20%20%20%20g%20DE%20%20%20A%20dBo%20R%20%20v%20%20%20v%205Cx%20%20%20%20X%20%20%20MzH%20%2008%20%20%20W%20MX%20q9%20%20%20%20%206GQ%20N%20%20%20pS%20F%20ZH%20Hl
 */