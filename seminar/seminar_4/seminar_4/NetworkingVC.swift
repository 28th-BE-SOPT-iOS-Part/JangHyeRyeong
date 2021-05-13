//
//  NetworkingVC.swift
//  seminar_4
//
//  Created by 장혜령 on 2021/05/08.
//

import UIKit

class NetworkingVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func getButtonClicked(_ sender: Any) {
        GetPersonDataService.shared.getPersonInfo { (response) in
            switch(response)
            {
            case .success(let personData):
                if let data = personData as? Person {
                    self.nameLabel.text = data.name
                    self.messageLabel.text = data.profileMessage
                }
            case .requestErr(let message) :
                print("requestERR",message)
            case .pathErr :
                print("pathERR")
            case .serverErr:
                print("serverERR")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
