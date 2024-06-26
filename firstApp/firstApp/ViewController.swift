//
//  ViewController.swift
//  firstApp
//
//  Created by Хамза Кабылбек on 26.06.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var textField2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        
        textField2.layer.cornerRadius = 10
        textField2.clipsToBounds = true
        
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        
    }

    @IBAction func touched(_ sender: Any) {
        
        let a = textField.text!
        
        let b = textField2.text!
        
        let sum = Int(a)! + Int(b)!
        
        label.text = "\(sum)"
    }
    
    
    @IBAction func minusTouch(_ sender: Any) {
        let a = textField.text!
        
        let b = textField2.text!
        let sum = Int(a)! - Int(b)!
        
        label.text = "\(sum)"
    }
    
    @IBAction func multiplyTouched(_ sender: Any) {
        let a = textField.text!
        
        let b = textField2.text!
        let sum = Int(a)! * Int(b)!
        
        label.text = "\(sum)"
    }
    
    @IBAction func divideTouched(_ sender: Any) {
        let a = textField.text!
        
        let b = textField2.text!
        let sum = Int(a)! / Int(b)!
        
        label.text = "\(sum)"
    }
    
}

