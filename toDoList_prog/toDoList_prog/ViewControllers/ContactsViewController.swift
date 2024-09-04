//
//  ViewController.swift
//  toDoList_prog
//
//  Created by Хамза Кабылбек on 04.09.2024.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddContactDelegate {

    var contacts: [(name: String, surname: String)] = []
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupTableView()
        loadContacts()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }

    func didAddContact(name: String, surname: String) {
        contacts.append((name, surname))
        tableView.reloadData()
        saveContacts()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = "\(contact.name) \(contact.surname)"
        return cell
    }


    private func saveContacts() {
        let contactsArray = contacts.map { ["name": $0.name, "surname": $0.surname] }
        UserDefaults.standard.set(contactsArray, forKey: "contacts")
    }

    private func loadContacts() {
        if let savedContacts = UserDefaults.standard.array(forKey: "contacts") as? [[String: String]] {
            contacts = savedContacts.compactMap { dict in
                guard let name = dict["name"], let surname = dict["surname"] else { return nil }
                return (name, surname)
            }
        }
    }
}
