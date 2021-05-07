//
//  PlusItemCVC.swift
//  mission-1
//
//  Created by 장혜령 on 2021/05/07.
//

import UIKit

class PlusItemCVC: UICollectionViewCell {

    @IBOutlet weak var itemNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setItemName(name: String){
        itemNameLabel.text = name
    }

}
