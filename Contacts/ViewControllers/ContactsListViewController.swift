//
//  ContactsListViewController.swift
//  Contacts
//
//  Created by Rahul Gupta on 25/07/19.
//  Copyright © 2019 Meesho. All rights reserved.
//

import UIKit

class ContactsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var viewModel: ContactListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Meesho Contacts"
        self.viewModel = ContactListViewModel()
        self.viewModel.fetchContacts()
        self.tableView.reloadData()
    }

    @IBAction func addContactAction(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        guard let createContactVC = storyboard.instantiateViewController(withIdentifier: "CreateOrEditContactViewController") as? CreateOrEditContactViewController else { return }
        let navController = UINavigationController(rootViewController: createContactVC)
        createContactVC.delegate = self
        self.navigationController?.present(navController, animated: true, completion: nil)
    }
}

extension ContactsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        if let createContactVC = storyboard.instantiateViewController(withIdentifier: "CreateOrEditContactViewController") as? CreateOrEditContactViewController {
            createContactVC.userDetails = self.viewModel.contactsList[indexPath.row]
            self.navigationController?.pushViewController(createContactVC, animated: true)
        }

    }
}



extension ContactsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.viewModel.contactCount == 0 {
            self.tableView.setEmptyMessage("No contacts to show.\nPlease add some.")
        } else {
            self.tableView.restore()
        }
        return self.viewModel.contactCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ContactsTableViewCell.self), for: indexPath) as! ContactsTableViewCell
        cell.setUp(contact: self.viewModel.contactsList[indexPath.row])
        return cell
    }
    
}

extension ContactsListViewController: CreateOrEditContactVCDelegate {
    func saveNew(contact: ContactsDataItem) {
        self.viewModel.saveContact(contact: contact)
        self.tableView.reloadData()
    }
}
