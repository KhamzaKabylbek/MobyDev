//
//  AddTaskViewController.swift
//  toDoList_prog
//
//  Created by Хамза Кабылбек on 04.09.2024.
//

import UIKit

class AddContactViewController: UIViewController {

    weak var delegate: AddContactDelegate?
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let surnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Surname"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Contact", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupViews()
        addButton.addTarget(self, action: #selector(addContact), for: .touchUpInside)
    }

    private func setupViews() {
        view.addSubview(nameTextField)
        view.addSubview(surnameTextField)
        view.addSubview(addButton)

        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            nameTextField.widthAnchor.constraint(equalToConstant: 250),

            surnameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            surnameTextField.widthAnchor.constraint(equalToConstant: 250),

            addButton.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 20),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func addContact() {
        guard let name = nameTextField.text, !name.isEmpty,
              let surname = surnameTextField.text, !surname.isEmpty else { return }
        delegate?.didAddContact(name: name, surname: surname)
        nameTextField.text = ""
        surnameTextField.text = ""
        navigationController?.popViewController(animated: true)
    }
}

