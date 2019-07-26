//
//  CreateContactViewModel.swift
//  Contacts
//
//  Created by Rahul Gupta on 25/07/19.
//  Copyright © 2019 Meesho. All rights reserved.
//

import Foundation

class CreateContactViewModel {
    
    func validate(email: String?) -> String? {
        guard let email = email, email.count > 0 else{
            return "Please Enter EmailId"
        }
        if !email.isValidEmail() {
            return "EmailId is not valid"
        }
        return nil
    }
    
    func validate(name:String?) -> String? {
        guard let fName = name, fName.count > 0,  fName.isValidName() else {
            return "Please enter a valid name"
        }
        if fName.count > 64
        {
            return "Full name is too long"
        }
        return nil
    }

    func validate(phoneNumber:String?) -> String?{
        guard let phone = phoneNumber, phone.count > 0, phone.isValidPhoneNumber() else{
            return "Please enter valid mobile number"
        }
        
        return nil
    }
    
    func validate(pinCode: String?) -> String? {
        guard let pinCode = pinCode, pinCode.count > 0, pinCode.count == 6 else{
            return "Please enter valid pincode"
        }
        return nil
    }
    
}
