//
//  SampleVC.swift
//  seminar_3
//
//  Created by 장혜령 on 2021/04/24.
//

import UIKit

class SampleVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var serviceList: [ServiceDataModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setServiceList()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        registerXib()
    }
    
    func registerXib(){
        let nibName = UINib(nibName: "SampleTVC", bundle: nil)
        tableview.register(nibName, forCellReuseIdentifier: "SampleTVC")
    }
    
    func setServiceList()
        {
            serviceList.append(contentsOf: [
                ServiceDataModel(iconImageName: "soptAppIcon1",
                                     title: "OUNCE - 집사를 위한 똑똑한 기록장",
                                     subtitle: "우리 고양이의 까다로운 입맛 정리 서비스"),
                
                ServiceDataModel(iconImageName: "soptAppIcon2",
                                     title: "포켓유니브",
                                     subtitle: "MZ세대를 위한, 올인원 대학생활 관리 플랫폼"),
                
                ServiceDataModel(iconImageName: "soptAppIcon3",
                                     title: "MOMO",
                                     subtitle: "책 속의 문장과 함께 쓰는 일기"),
                
                ServiceDataModel(iconImageName: "soptAppIcon4",
                                     title: "Weathy(웨디)",
                                     subtitle: "나에게 돌아오는 맞춤 날씨 서비스"),
                
                ServiceDataModel(iconImageName: "soptAppIcon5",
                                     title: "BeMe",
                                     subtitle: "나를 알아가는 질문 다이어리"),
                
                ServiceDataModel(iconImageName: "soptAppIcon6",
                                     title: "placepic",
                                     subtitle: "우리들끼리 공유하는 최애장소, 플레이스픽"),
                
                ServiceDataModel(iconImageName: "soptAppIcon7",
                                     title: "몽글(Mongle)",
                                     subtitle: "우리가 만드는 문장 큐레이션 플랫폼, 몽글")
            ])
        }
}

extension SampleVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }
}

extension SampleVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serviceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: SampleTVC.identifier) as? SampleTVC else {
            return UITableViewCell()
        }
        
        cell.setData(title: serviceList[indexPath.row].title, subTitle: serviceList[indexPath.row].subtitle, iconName: serviceList[indexPath.row].iconImageName)
        
        return cell
    }
    
    
}
