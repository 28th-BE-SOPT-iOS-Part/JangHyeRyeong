//
//  ProfileVC.swift
//  mission-1
//
//  Created by 장혜령 on 2021/04/23.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    var profile: FriendDataModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setContent()
    }
    
    @IBAction func closeProfileView(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

//MARK: UI
extension ProfileVC{
    func setProfileData(profile: FriendDataModel?){
        self.profile = profile
    }
    
    func setContent(){
        if let profile = self.profile{
            profileImageView.image = profile.image
            nameLabel.text = profile.name
        }
    }
}
