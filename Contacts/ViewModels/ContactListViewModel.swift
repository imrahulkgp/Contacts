//
//  ContactListViewModel.swift
//  Contacts
//
//  Created by Rahul Gupta on 25/07/19.
//  Copyright © 2019 Meesho. All rights reserved.
//

import Foundation

class ContactListViewModel {
    var contactsList: [ContactsDataItem] = []
    
    var contactCount: Int {
        get {
            return self.contactsList.count
        }
    }
    
    @discardableResult func fetchContacts() -> [ContactsDataItem] {
        if let decoded  = UserDefaults.standard.data(forKey: Constants.dataPath) {
            contactsList = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [ContactsDataItem] ?? []
            return contactsList
        }
        return []
    }
    
    func saveContact(contact: ContactsDataItem) {
        contactsList.append(contact)
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: contactsList)
        UserDefaults.standard.set(encodedData, forKey: Constants.dataPath)
    }
    
}
