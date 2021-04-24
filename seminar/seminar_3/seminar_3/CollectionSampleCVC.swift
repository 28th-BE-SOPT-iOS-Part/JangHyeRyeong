//
//  CollectionSampleCVC.swift
//  seminar_3
//
//  Created by 장혜령 on 2021/04/24.
//

import UIKit

class CollectionSampleCVC: UICollectionViewCell {

    static let identifier: String = "CollectionSampleCVC"
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setDate(iconName: String, title: String, subtitle: String){
        titleLabel.text = title
        subtitleLabel.text = subtitle
        
        if let icon = UIImage(named: iconName){
            iconImageView.image = icon
        }
    }

}
