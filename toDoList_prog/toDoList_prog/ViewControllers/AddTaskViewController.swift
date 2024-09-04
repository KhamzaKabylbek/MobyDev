//
//  AddTaskViewController.swift
//  toDoList_prog
//
//  Created by Хамза Кабылбек on 04.09.2024.
//

import UIKit

class AddTaskViewController: UIViewController {

    weak var delegate: AddTaskDelegate?
    
    private let taskTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter task"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Task", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupViews()
        addButton.addTarget(self, action: #selector(addTask), for: .touchUpInside) // Add target action for button
    }

    private func setupViews() {
        view.addSubview(taskTextField)
        view.addSubview(addButton)

        // Layout constraints for text field and button
        NSLayoutConstraint.activate([
            taskTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            taskTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            taskTextField.widthAnchor.constraint(equalToConstant: 250),

            addButton.topAnchor.constraint(equalTo: taskTextField.bottomAnchor, constant: 20),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func addTask() {
        guard let taskText = taskTextField.text, !taskText.isEmpty else { return }
        delegate?.didAddTask(taskText) // Call delegate method to pass the task
        taskTextField.text = "" // Clear the text field
        navigationController?.popViewController(animated: true) // Go back to the previous view
    }
}
