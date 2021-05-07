//
//  FriendsVC.swift
//  mission-1
//
//  Created by 장혜령 on 2021/04/23.
//

import UIKit

class FriendsVC: UIViewController {

    @IBOutlet weak var tabbarItem: UITabBarItem!
    @IBOutlet weak var settingButton: UIButton!
    //@IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileTableView: UITableView!
    
    private var friendList:[FriendDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //setActionToProfileImage()
        setClickedTabbarItem(tabItem: tabbarItem, ImageName: "friendTabIconSelected")
        setFriendList()
        registerXib()
        profileTableView.dataSource = self
        profileTableView.delegate = self
    }
    
    func registerXib(){
        let userNibName = UINib(nibName: "UserProfileTVC", bundle: nil)
        profileTableView.register(userNibName, forCellReuseIdentifier: "UserProfileTVC")
        let friendNibName = UINib(nibName: "FreindsProfileTVC", bundle: nil)
        profileTableView.register(friendNibName, forCellReuseIdentifier: "FreindsProfileTVC")
        
    }
    
//    func setActionToProfileImage(){
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpProfile))
//        profileImageView.addGestureRecognizer(tapGesture)
//        profileImageView.isUserInteractionEnabled = true
//    }
    
    
    @IBAction func touchUpProfile(){
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "ProfileVC") as? ProfileVC else {
            return
        }
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
}

extension FriendsVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 73
        }
        return 50
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

extension FriendsVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("현재 section = \(indexPath.section), row = \(indexPath.row)")
        let background = UIView()
        background.backgroundColor = .clear
        
        if indexPath.section == 0{
            guard let cell = profileTableView.dequeueReusableCell(withIdentifier: "UserProfileTVC") as? UserProfileTVC else {
                return UITableViewCell()
            }
            cell.selectedBackgroundView = background
            return cell
        }
        
        guard let cell = profileTableView.dequeueReusableCell(withIdentifier: "FreindsProfileTVC") as? FreindsProfileTVC else {
            return UITableViewCell()
        }
        
        cell.setCellContent(profile: friendList[indexPath.row])
        cell.selectedBackgroundView = background
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "ProfileVC") as? ProfileVC else {
            return
        }
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.setProfileData(profile: friendList[indexPath.row])
        
        if indexPath.section == 0{
            let userProfileData = FriendDataModel(imageName: "friendtabProfileImg",
                                                  name: "김솝트",
                                                  state: "상태메세지")
            
            nextVC.setProfileData(profile: userProfileData)
        }
        self.present(nextVC, animated: true, completion: nil)
    }
}


extension FriendsVC {
    func setFriendList()
        {
            friendList.append(contentsOf: [
                FriendDataModel(imageName: "profileImage1",
                                name: "안솝트",
                                state: "배고파요"),
                
                FriendDataModel(imageName: "profileImage2",
                                name: "최솝트",
                                state: "피곤해요"),
                
                FriendDataModel(imageName: "profileImage3",
                                name: "정솝트",
                                state: "시험언제끝나죠?"),
                
                FriendDataModel(imageName: "profileImage4",
                                name: "이솝트",
                                state: "ㅠㅠㅠㅠ"),
                
                FriendDataModel(imageName: "profileImage5",
                                name: "유솝트",
                                state: "나는 상태메세지!"),
                
                FriendDataModel(imageName: "profileImage6",
                                name: "박솝트",
                                state: "원하는대로 바꿔보세요 ^_^"),
                
                FriendDataModel(imageName: "profileImage7",
                                name: "최솝트",
                                state: "넘 덥다.."),
                
                FriendDataModel(imageName: "profileImage8",
                                name: "원솝트",
                                state: "배고파요"),
                
                FriendDataModel(imageName: "profileImage9",
                                name: "투솝트",
                                state: "내꿈은 대나무부자"),
                
                FriendDataModel(imageName: "profileImage10",
                                name: "권솝트",
                                state: "걱정말라구!")
                
            ])
        }
}
