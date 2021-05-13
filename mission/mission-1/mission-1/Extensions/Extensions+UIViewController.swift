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
        //tabItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
    }
    
    func makeRequestAlert(title : String,
                           message : String,
                           okAction : ((UIAlertAction) -> Void)?,
                           cancelAction : ((UIAlertAction) -> Void)? = nil,
                           completion : (() -> Void)? = nil)
    {
            
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        let alertViewController = UIAlertController(title: title, message: message,
                                                    preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: cancelAction)
        alertViewController.addAction(cancelAction)
        

        self.present(alertViewController, animated: true, completion: completion)
    }
        
        
    func makeAlert(title : String,
                   message : String,
                   okAction : ((UIAlertAction) -> Void)? = nil,
                   completion : (() -> Void)? = nil)
    {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        let alertViewController = UIAlertController(title: title, message: message,
                                                    preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        
        
        self.present(alertViewController, animated: true, completion: nil)
    }
    
}
