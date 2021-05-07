//
//  TextFieldDelegateVC.swift
//  seminar_3
//
//  Created by 장혜령 on 2021/04/24.
//

import UIKit

class TextFieldDelegateVC: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }

}

extension TextFieldDelegateVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textLabel.text = textField.text ?? ""
        return true
    }
    
}
