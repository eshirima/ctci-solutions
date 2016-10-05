//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct GeneralUser
{
    var name: String = "", lastName: String?, number: String = "1234"
    
    init()
    {
        
    }
    
    init(userName: String, lastName: String = "")
    {
        name = userName
    }
}

class CurrentUser: NSObject
{
    var details: GeneralUser? = nil
    
    static let sharedInstance: CurrentUser = CurrentUser()
    
    fileprivate override init()
    {
        super.init()
    }
}

let temp = CurrentUser.sharedInstance
var userDetails = GeneralUser(userName: "Hello")
userDetails.number = "442324333"
temp.details = userDetails

print(temp.details?.name)
