//
//  DelegateVC.swift
//  seminar_3
//
//  Created by 장혜령 on 2021/04/24.
//

import UIKit


protocol SampleProtocol{
    func dataSend(data: String)
}

class DelegateVC: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    
    var delegate : SampleProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dataSendButtonClicked(_ sender: Any) {
        
        if var text = dataTextField.text {
            text = "노티에서 넘어옴 \(text)"
            NotificationCenter.default.post(name: NSNotification.Name("sample"), object: text)
//            delegate?.dataSend(data: text)
        }
        
        self.navigationController?.popViewController(animated: true)
    }

}
