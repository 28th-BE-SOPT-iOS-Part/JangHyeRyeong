//
//  ProfileVC.swift
//  mission-1
//
//  Created by 장혜령 on 2021/04/23.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeProfileView(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
   

}
