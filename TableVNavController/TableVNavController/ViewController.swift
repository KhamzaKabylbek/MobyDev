//
//  ViewController.swift
//  TableVNavController
//
//  Created by Хамза Кабылбек on 26.06.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelName: UILabel!
    
    @IBOutlet var labelSurname: UILabel!
    
    @IBOutlet var Imageview: UIImageView!
    
    @IBOutlet var ProKino: UILabel!
    
    var name = ""
    var surname = ""
    var ImageName = ""
    var proKino = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelName.text = name
        labelSurname.text = surname
        Imageview.image = UIImage(named: ImageName)
        ProKino.text = proKino
        
    }


}

