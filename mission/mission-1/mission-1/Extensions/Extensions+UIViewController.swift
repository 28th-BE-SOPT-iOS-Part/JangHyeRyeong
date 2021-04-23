//
//  Extensions+UIViewController.swift
//  mission-1
//
//  Created by 장혜령 on 2021/04/23.
//

import Foundation
import UIKit

extension UIViewController{
    func setClickedTabbarItem(tabItem: UITabBarItem, ImageName: String){
        tabItem.selectedImage = UIImage(systemName: ImageName)
        tabItem.title = ""
        tabItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
    }
}
