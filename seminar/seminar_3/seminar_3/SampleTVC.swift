//
//  SampleTVC.swift
//  seminar_3
//
//  Created by 장혜령 on 2021/04/24.
//

import UIKit

class SampleTVC: UITableViewCell {

    static let identifier: String = "SampleTVC"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var selectionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setData(title: String, subTitle: String, iconName: String){
        titleLabel.text = title
        subtitleLabel.text = subTitle
        
        if let icon = UIImage(named: iconName){
            iconImageView.image = icon
        }
        
    }
    
    
    
}
