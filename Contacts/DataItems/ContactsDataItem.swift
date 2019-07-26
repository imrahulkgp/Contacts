//
//  ContactsDataItem.swift
//  Contacts
//
//  Created by Rahul Gupta on 25/07/19.
//  Copyright © 2019 Meesho. All rights reserved.
//

import Foundation

//struct ContactsDataItem {
//    let name: String
//    let phoneNumber: String
//    let pinCode: String
//    let emailId: String
//}

class ContactsDataItem: NSObject, NSCoding {
    var name: String
    var phoneNumber: String
    var pinCode: String
    var emailId: String
    
    init(name: String, phoneNumber: String, pinCode: String, emailId: String) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.pinCode = pinCode
        self.emailId = emailId
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name")
        let phoneNumber = aDecoder.decodeObject(forKey: "phoneNumber")
        let pinCode = aDecoder.decodeObject(forKey: "pinCode")
        let emailId = aDecoder.decodeObject(forKey: "emailId")
        self.init(name: name as! String, phoneNumber: phoneNumber as! String, pinCode: pinCode as! String, emailId: emailId as! String)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(phoneNumber, forKey: "phoneNumber")
        aCoder.encode(pinCode, forKey: "pinCode")
        aCoder.encode(emailId, forKey: "emailId")
    }
}
