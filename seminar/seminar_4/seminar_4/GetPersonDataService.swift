//
//  GetPersonDataService.swift
//  seminar_4
//
//  Created by 장혜령 on 2021/05/08.
//

import Foundation
import Alamofire


struct GetPersonDataService{
    static let shared = GetPersonDataService()
    
    func getPersonInfo(completion : @escaping (NetworkResult<Any>) -> Void)
    {
        // completion 클로저를 @escaping closure로 정의합니다.
        let URL = "https://mocki.io/v1/e5b82f33-832c-43ae-83c8-c3e053a4ead7"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = AF.request(URL,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            
            switch dataResponse.result {
            case .success:
                                
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            
            case .failure: completion(.pathErr) // 서버자체에서 응답이 오지 않은 경우
                
            }
        }
                                            
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
          
        switch statusCode {
        
        case 200: return isValidData(data: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    
    
    private func isValidData(data : Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()

        guard let decodedData = try? decoder.decode(PersonDataModel.self, from: data)
        else { return .pathErr}
        // 우선 PersonDataModel 형태로 decode(해독)을 한번 거칩니다. 실패하면 pathErr
        
        // 해독에 성공하면 Person data를 success에 넣어줍니다.
        return .success(decodedData.data)

    }
    
}
