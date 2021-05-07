//
//  ViewController.swift
//  seminar_3
//
//  Created by 장혜령 on 2021/04/24.
//

import UIKit

class ViewController: UIViewController, SampleProtocol{
  
    @IBOutlet weak var dataLabel: UILabel!
    
    func dataSend(data: String) {
        dataLabel.text = data
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToNextVC(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "DelegateVC") as? DelegateVC else {
            return
        }
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(dataReceive),
                                               name: Notification.Name("sample"),
                                               object: nil)
        
        
     //   nextVC.delegate = self
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    @objc func dataReceive(notification: Notification){
        if let text = notification.object as? String{
            dataLabel.text = text
        }
    }
    
}

