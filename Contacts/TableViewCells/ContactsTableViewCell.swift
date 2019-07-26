//
//  ContactsTableViewCell.swift
//  Contacts
//
//  Created by Rahul Gupta on 25/07/19.
//  Copyright © 2019 Meesho. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUp(contact: ContactsDataItem) {
        self.nameLabel.text = contact.name
        self.emailLabel.text = contact.emailId
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
