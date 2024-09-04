//
//  ViewController.swift
//  toDoList_prog
//
//  Created by Хамза Кабылбек on 04.09.2024.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTaskDelegate {

    var tasks: [String] = []
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupTableView()
        loadTasks() 
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }

    func didAddTask(_ task: String) {
        tasks.append(task)
        tableView.reloadData()
        saveTasks()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            saveTasks()
        }
    }

    private func saveTasks() {
        UserDefaults.standard.set(tasks, forKey: "tasks")
    }

    private func loadTasks() {
        if let savedTasks = UserDefaults.standard.array(forKey: "tasks") as? [String] {
            tasks = savedTasks
        }
    }
}
