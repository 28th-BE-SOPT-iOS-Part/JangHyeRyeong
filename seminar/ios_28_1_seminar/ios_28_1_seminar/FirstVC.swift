//
//  FirstVC.swift
//  ios_28_1_seminar
//
//  Created by 장혜령 on 2021/04/03.
//

import UIKit

class FirstVC: UIViewController {
    @IBOutlet var nameTitleField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func touchUpNextVC(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SecondVC") as? SecondVC else {
            return
        }
        
        nextVC.name = nameTitleField.text
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
}
