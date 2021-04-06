//
//  ViewController.swift
//  mission-1
//
//  Created by 장혜령 on 2021/04/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var subtitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubTitle()
    }

    @IBAction func touchUpLogin(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "ConfirmVC") as? ConfirmVC else {
            return
        }
        nextVC.setIdText(id: idTextField.text)
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
        
    }
    
    @IBAction func makeNewAccount(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SignUpVC") as? SignUpVC else {
            return
        }
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    func setSubTitle(){
        subtitleLabel.numberOfLines = 0
        subtitleLabel.text = "사용하던 카카오계정이 있다면\n이메일 또는 전화번호로 로그인해 주세요."
    }
    
}

