//
//  ViewController.swift
//  seminar_4
//
//  Created by 장혜령 on 2021/05/08.
//

import UIKit

struct PersonData: Encodable{
    var name: String
    var age: Int
}

class ViewController: UIViewController {

    let personData = PersonData(name: "철수", age: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        
        do{
            let data = try jsonEncoder.encode(personData)
            print(String(data: data, encoding: .utf8)!)
        }catch{
            print(error)
        }
        

    }


}

