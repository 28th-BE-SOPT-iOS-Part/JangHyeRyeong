//
//  Profile.swift
//  mission-1
//
//  Created by 장혜령 on 2021/05/07.
//

import Foundation
import UIKit.UIImage

struct FriendDataModel{
    var image : UIImage
    var name : String
    var state: String
    
    init(imageName : String,
         name : String,
         state: String)
    {
        if let image = UIImage(named: imageName){
            self.image = image
        } else {
            self.image = UIImage()
        }
        
        self.name = name
        self.state = state
    }
    
}
