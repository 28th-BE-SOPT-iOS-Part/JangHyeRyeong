//
//  LoginService.swift
//  seminar_4_practise
//
//  Created by 장혜령 on 2021/05/12.
//

import Foundation
import Alamofire

struct LoginService{
    static let shared = LoginService()
    
    private func makeParameter(email: String, password: String) -> Parameters{
        return ["email" : email,
                "password" : password]
    }

    func login(email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> Void){
               
        let header: HTTPHeaders 
    
    }
               
    
}
