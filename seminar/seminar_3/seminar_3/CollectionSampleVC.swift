//
//  CollectionSampleVC.swift
//  seminar_3
//
//  Created by 장혜령 on 2021/04/24.
//

import UIKit

class CollectionSampleVC: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var musicList: [ServiceDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMusicList()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        registerXib()
        // Do any additional setup after loading the view.
    }
    
    
    func registerXib(){
        let nibName = UINib(nibName: "CollectionSampleCVC", bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "CollectionSampleCVC")
    }
    
    func setMusicList()
       {
           musicList.append(contentsOf: [
            ServiceDataModel(iconImageName: "musicAlbum1",
                             title: "가습기",
                             subtitle: "한요한"),
               
            ServiceDataModel(iconImageName: "musicAlbum2",
                             title: "Thick and Thin",
                             subtitle: "LANY"),
               
            ServiceDataModel(iconImageName: "musicAlbum3",
                             title: "시공간",
                             subtitle: "기리보이"),
               
            ServiceDataModel(iconImageName: "musicAlbum4",
                             title: "NISEKOI",
                             subtitle: "Futuristic Swaver")
           ])
       }

}

extension CollectionSampleVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        musicList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionSampleCVC", for: indexPath) as? CollectionSampleCVC else {
            return UICollectionViewCell()
        }
        
        cell.setDate(iconName: musicList[indexPath.row].iconImageName, title: musicList[indexPath.row].title, subtitle: musicList[indexPath.row].subtitle)
        
        return cell
    }
    
    
}

extension CollectionSampleVC: UICollectionViewDelegate{
    
}

extension CollectionSampleVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width
                
        let cellWidth = width * (177/375)
        let cellHeight = cellWidth * (205/177)
            
        return CGSize(width: cellWidth, height: cellHeight)
      
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
}
