//
//  SecondVC.swift
//  ios_28_1_seminar
//
//  Created by 장혜령 on 2021/04/03.
//

import UIKit

class SecondVC: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
        // Do any additional setup after loading the view.
    }
    
    func setLabel(){
        if let name = self.name{
            titleLabel.text = name
        }
    }
    
    
    @IBAction func touchUpBack(_ sender: Any) {
        
        //self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
}
