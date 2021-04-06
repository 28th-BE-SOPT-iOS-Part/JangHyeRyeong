//
//  ViewController.swift
//  ios_28_1_seminar
//
//  Created by 장혜령 on 2021/04/03.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var numberTextField: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.keyboardType = .default
        numberTextField.keyboardType = .phonePad
        
    }

    @IBAction func touchUpButton(_ sender: Any) {
        var userName = ""
        var phoneNumber = ""
        
        if let name = nameTextField.text{
            userName = name
        }
        
        if let phone = numberTextField.text{
            phoneNumber = phone
        }
        
        titleLabel.text = "\(userName) 의 번호는 \(phoneNumber) 입니다"
        titleLabel.textColor = .red
    }
    
    
}

