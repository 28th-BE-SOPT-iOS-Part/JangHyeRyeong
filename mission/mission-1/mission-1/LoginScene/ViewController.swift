//
//  ViewController.swift
//  mission-1
//
//  Created by 장혜령 on 2021/04/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    var successCheck: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubTitle()
    }

    @IBAction func touchUpLogin(_ sender: Any) {
        self.makeRequestAlert(title: "알림",
                                     message: "로그인을 하시겠습니까?",
                                     okAction: { _ in
                                       self.loginAction()
                                     })
        
        }

    func loginAction()
    {
        LoginService.shared.login(email: self.idTextField.text!, password: self.passwordTextField.text!) { result in
            //print("email \(email) pw: \(password)" )
            switch result
            {
            case .success(let message):
                if let message = message as? String{
                    
                    self.makeAlert(title: "알림",
                                   message: message)
                }
                
            case .requestErr(let message):
                
                if let message = message as? String{
                    
                    self.makeAlert(title: "알림",message: message)
                    
                }
            default :
                print("ERROR")
            }
        }
    }

    func goToFriendView(){
        let storyboard = UIStoryboard(name: "Tabbar", bundle: nil)
        if idTextField.text != "" && passwordTextField.text != ""{
            guard let nextVC = storyboard.instantiateViewController(identifier: "TabbarController") as? TabbarController else {
                return
            }
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
        }
        
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

