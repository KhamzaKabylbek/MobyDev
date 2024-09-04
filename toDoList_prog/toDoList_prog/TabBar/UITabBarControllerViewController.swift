//
//  UITabBarControllerViewController.swift
//  toDoList_prog
//
//  Created by Хамза Кабылбек on 04.09.2024.
//

import UIKit

class UITabBarControllerViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let customTabBar = CustomTabBar()
        setValue(customTabBar, forKey: "tabBar")

        let contactsVC = ContactsViewController()
        contactsVC.title = "Contacts"
        let contactsNavController = UINavigationController(rootViewController: contactsVC)
        contactsNavController.tabBarItem = UITabBarItem(title: "Contacts", image: UIImage(systemName: "person.2"), tag: 0)

        let addContactVC = AddContactViewController()
        addContactVC.delegate = contactsVC
        let addContactNavController = UINavigationController(rootViewController: addContactVC)
        addContactNavController.tabBarItem = UITabBarItem(title: "Add Contact", image: UIImage(systemName: "plus.circle"), tag: 1)

        self.viewControllers = [contactsNavController, addContactNavController]
    }
}
