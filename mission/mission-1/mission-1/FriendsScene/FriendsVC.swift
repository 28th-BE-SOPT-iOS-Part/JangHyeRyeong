//
//  FriendsVC.swift
//  mission-1
//
//  Created by 장혜령 on 2021/04/23.
//

import UIKit

class FriendsVC: UIViewController {

    @IBOutlet weak var tabbarItem: UITabBarItem!
    @IBOutlet weak var profileImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setActionToProfileImage()
        setClickedTabbarItem(tabItem: tabbarItem, ImageName: "person.fill")
    }
    
    func setActionToProfileImage(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpProfile))
        profileImageView.addGestureRecognizer(tapGesture)
        profileImageView.isUserInteractionEnabled = true
    }
    
    
    @IBAction func touchUpProfile(){
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "ProfileVC") as? ProfileVC else {
            return
        }
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    

}
