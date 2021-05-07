//
//  PlusVC.swift
//  mission-1
//
//  Created by 장혜령 on 2021/04/23.
//

import UIKit

class PlusVC: UIViewController {

    @IBOutlet weak var plusItemsCollectionView: UICollectionView!
    @IBOutlet weak var tabbarItem: UITabBarItem!
    
    var itemList: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setClickedTabbarItem(tabItem: tabBarItem, ImageName: "detailTabIconSelected")
        setItemNameList()
        registerXib()
        plusItemsCollectionView.delegate = self
        plusItemsCollectionView.dataSource = self
    }
   
    func registerXib(){
        let userNibName = UINib(nibName: "PlusItemCVC", bundle: nil)
        plusItemsCollectionView.register(userNibName, forCellWithReuseIdentifier: "PlusItemCVC")
        
    }

}


extension PlusVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = plusItemsCollectionView.dequeueReusableCell(withReuseIdentifier: "PlusItemCVC", for: indexPath) as? PlusItemCVC else {
            return UICollectionViewCell()
        }
        
        cell.setItemName(name: itemList[indexPath.row])
        return cell
    }
    
    
}

extension PlusVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellSize = (width - (19*5))/4
        return CGSize(width: cellSize, height: cellSize)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        19
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        3
    }
}

extension PlusVC{
    func setItemNameList(){
        itemList.append(contentsOf: ["메일", "캘린더", "서랍", "카카오콘",
                                     "메이커스", "선물하기", "이모티콘", "프렌즈",
                                    "쇼핑하기", "스타일", "주문하기", "멜론티켓",
                                    "게임", "멜론", "헤어샵", "전체서비스"])
    }
}
