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

        let toDoListVC = ListViewController()
        toDoListVC.title = "To Do List"
        let toDoNavController = UINavigationController(rootViewController: toDoListVC)
        toDoNavController.tabBarItem = UITabBarItem(title: "To Do List", image: UIImage(systemName: "list.bullet"), tag: 0)

        let addTaskVC = AddTaskViewController()
        addTaskVC.delegate = toDoListVC // Установка делегата
        let addTaskNavController = UINavigationController(rootViewController: addTaskVC)
        addTaskNavController.tabBarItem = UITabBarItem(title: "Add Task", image: UIImage(systemName: "plus.square.fill"), tag: 1)

        self.viewControllers = [toDoNavController, addTaskNavController]
    }
}
