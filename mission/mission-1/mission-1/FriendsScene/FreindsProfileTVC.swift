//
//  FreindsListCell.swift
//  mission-1
//
//  Created by 장혜령 on 2021/05/07.
//

import UIKit

class FreindsProfileTVC: UITableViewCell {
    static let identifier: String = "FreindsProfileTVC"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var stateMessageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellContent(profile: FriendDataModel){
        profileImageView.image = profile.image
        nameLabel.text = profile.name
        stateMessageLabel.text = profile.state
    }
    
}
