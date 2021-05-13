//
//  SignUpVC.swift
//  mission-1
//
//  Created by 장혜령 on 2021/04/06.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var checkPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func makeNewAccount(_ sender: Any) {
        //비밀번호 제대로 쳤는지 확인
        
        if !checkAllText(){
            return
        }
        checkPassword()
        
        self.makeRequestAlert(title: "알림",
                             message: "회원가입을 하시겠습니까?",
                             okAction: { _ in
                               self.signUpAction()
                             })

        
        
       
        
        let storyboard = UIStoryboard(name: "Tabbar", bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(identifier: "TabbarController") as? TabbarController else {
            return
        }
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }

    
    func signUpAction()
    {
        LoginService.shared.signUp(email: self.idTextField.text!, password: self.passwordTextField.text!) { result in
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
                    
                    self.makeAlert(title: "알림",
                              message: message)
                    
                }
            default :
                print("ERROR")
            }
        }
    }
    
    
    func checkAllText() -> Bool{
        if idTextField.text == "" ||
        passwordTextField.text == "" ||
            checkPasswordTextField.text == "" {
            return false
        }
        return true
    }
    
    func checkPassword() {
        if let firstPW = passwordTextField.text,
           let secondPW = checkPasswordTextField.text{
            if firstPW != secondPW{
                let alert = UIAlertController(title: "비밀번호 확인", message: "비밀번호가 맞지 않습니다.\n다시 입력해주시길 바랍니다.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.popViewController(animated: true)
        print("pop 된다")
    }
    
}
