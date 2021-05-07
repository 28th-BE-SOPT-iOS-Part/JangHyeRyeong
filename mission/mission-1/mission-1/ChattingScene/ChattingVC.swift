//
//  ChattingVC.swift
//  mission-1
//
//  Created by 장혜령 on 2021/04/23.
//

import UIKit

class ChattingVC: UIViewController {

    @IBOutlet weak var tabbarItem: UITabBarItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        setClickedTabbarItem(tabItem: tabbarItem, ImageName: "messageTabIconSelected")
        
    }
    

   

}
