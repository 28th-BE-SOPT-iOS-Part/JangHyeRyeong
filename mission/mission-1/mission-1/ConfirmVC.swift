//
//  ConfirmVC.swift
//  mission-1
//
//  Created by 장혜령 on 2021/04/06.
//

import UIKit

class ConfirmVC: UIViewController {
    
    @IBOutlet var idLabal: UILabel!
    var id : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setIdLabel()
    }

    func setIdText(id: String?){
        if let userId = id{
            self.id = userId
        }else{
            self.id = "이름이 입력되지 않음"
        }
    }
    
    func setIdLabel(){
        idLabal.numberOfLines = 0
        idLabal.text = "\(id)님\n환영합니다"
    }
    
    @IBAction func touchUpConfirm(_ sender: Any) {

        dismiss(animated: true, completion: nil)
        print("dismiss 완료")
    }

}
