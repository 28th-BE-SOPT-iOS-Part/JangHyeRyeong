//
//  LoginService.swift
//  mission-1
//
//  Created by 장혜령 on 2021/05/13.
//

import Foundation
import Alamofire

struct LoginService {
    static let shared = LoginService()
    
    private func makeParameter(email: String, password: String) -> Parameters{
        return ["email" : email,
                "password" : password]
    }
    
    private func makeSignUpParameter(email: String, password: String) -> Parameters{
        return ["email" : email,
                "password" : password,
                "sex" : "0",
                "nickname" : "ios_test",
                "phone" : "010-1111-1234",
                "birth" : "1996-02-24"]
    }
    
    func login(email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> Void){
        
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let dataRequest = AF.request(APIConstants.loginURL,
                                     method: .post,
                                     parameters: makeParameter(email: email, password: password),
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData{ dataResponse in
            
            dump(dataResponse)
            
            switch dataResponse.result{
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkdResult = self.judgeStatus(by: statusCode, value)
                completion(networkdResult)
            case .failure: completion(.pathErr)
            }
            
        }
        
    }
    
    func signUp(email: String,
                password: String,
                completion: @escaping (NetworkResult<Any>) -> Void){

        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let dataRequest = AF.request(APIConstants.signupURL,
                                  method: .post,
                                  parameters: makeSignUpParameter(email: email, password: password),
                                  encoding: JSONEncoding.default,
                                  headers: header)

        dataRequest.responseData{ dataResponse in
 
            dump(dataResponse)
 
             switch dataResponse.result{
             case .success:
                 guard let statusCode = dataResponse.response?.statusCode else {return}
                 guard let value = dataResponse.value else {return}
                 let networkdResult = self.judgeStatus(by: statusCode, value)
                 completion(networkdResult)
             case .failure: completion(.pathErr)
             }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        
        guard let decodeDate = try? decoder.decode(LoginDataModel.self, from: data) else {
            return .pathErr
        }
        
        switch statusCode {
        case 200: return .success(decodeDate.message)
        case 400: return .requestErr(decodeDate.message)
        case 500: return .serverErr
        default: return .networkFail
        }
        
    }
    
    
}
