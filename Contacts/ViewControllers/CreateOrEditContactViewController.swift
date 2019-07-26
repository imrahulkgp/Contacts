//
//  CreateOrEditContactViewController.swift
//  Contacts
//
//  Created by Rahul Gupta on 26/07/19.
//  Copyright © 2019 Meesho. All rights reserved.
//

import UIKit

protocol CreateOrEditContactVCDelegate: class {
    func saveNew(contact: ContactsDataItem)
}

class CreateOrEditContactViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var pinCodeTextField: UITextField!
    @IBOutlet weak var emailIdTextField: UITextField!
    
    @IBOutlet weak var nameErrorLabel: UILabel!
    @IBOutlet weak var phoneNumberErrorLabel: UILabel!
    @IBOutlet weak var pinCodeErrorLabel: UILabel!
    @IBOutlet weak var emailIdErrorLabel: UILabel!
    
    var viewModel: CreateContactViewModel!
    weak var delegate: CreateOrEditContactVCDelegate?
    var viewBottomOffset:CGFloat = 0
    var userDetails: ContactsDataItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create New Contact"
        self.viewModel = CreateContactViewModel()
        setUpUserData()
    }
    
    func setUpUserData() {
        if let user = userDetails {
            self.title = user.name
            self.nameTextField.text = user.name
            self.phoneNumberTextField.text = user.phoneNumber
            self.pinCodeTextField.text = user.pinCode
            self.emailIdTextField.text = user.emailId
            self.nameTextField.isEnabled = false
            self.phoneNumberTextField.isEnabled = false
            self.pinCodeTextField.isEnabled = false
            self.emailIdTextField.isEnabled = false
            self.navigationItem.rightBarButtonItem = nil
            self.navigationItem.leftBarButtonItem = nil
        }
    }
    
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        var isValidInput = true
        if let error = viewModel.validate(name: nameTextField.text) {
            nameErrorLabel.text = error
            isValidInput = false
        } else {
            nameErrorLabel.text = ""
        }
        
        if let error = viewModel.validate(phoneNumber: phoneNumberTextField.text) {
            phoneNumberErrorLabel.text = error
            isValidInput = false
        } else {
            phoneNumberErrorLabel.text = ""
        }
        
        if let error = viewModel.validate(pinCode: pinCodeTextField.text) {
            pinCodeErrorLabel.text = error
            isValidInput = false
        } else {
            pinCodeErrorLabel.text = ""
        }
        
        if let error = viewModel.validate(email: emailIdTextField.text) {
            emailIdErrorLabel.text = error
            isValidInput = false
        } else {
            emailIdErrorLabel.text = ""
        }
        if isValidInput {
            if let name = nameTextField.text,
                let phoneNumber = phoneNumberTextField.text,
                let pinCode = pinCodeTextField.text,
                let emailId = emailIdTextField.text {
                self.delegate?.saveNew(contact: ContactsDataItem(name: name, phoneNumber: phoneNumber, pinCode: pinCode, emailId: emailId))
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func CancelAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension CreateOrEditContactViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            phoneNumberTextField.becomeFirstResponder()
        case phoneNumberTextField:
            pinCodeTextField.becomeFirstResponder()
        case pinCodeTextField:
            emailIdTextField.becomeFirstResponder()
        default:
            emailIdTextField.resignFirstResponder()
        }
        return true
    }
}
