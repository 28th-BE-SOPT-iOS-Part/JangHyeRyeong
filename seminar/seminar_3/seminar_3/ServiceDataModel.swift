//
//  ServiceDataModel.swift
//  seminar_3
//
//  Created by 장혜령 on 2021/04/24.
//

import Foundation
import UIKit

struct ServiceDataModel{
    var title: String
    var subtitle: String
    var iconImageName: String
    
    init(iconImageName: String, title: String, subtitle: String){
        self.iconImageName = iconImageName
        self.title = title
        self.subtitle = subtitle
    }
}
