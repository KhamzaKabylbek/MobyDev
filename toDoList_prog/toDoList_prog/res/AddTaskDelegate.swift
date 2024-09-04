//
//  AddTaskDelegate.swift
//  toDoList_prog
//
//  Created by Хамза Кабылбек on 04.09.2024.
//

import Foundation

protocol AddTaskDelegate: AnyObject {
    func didAddTask(_ task: String)
}
