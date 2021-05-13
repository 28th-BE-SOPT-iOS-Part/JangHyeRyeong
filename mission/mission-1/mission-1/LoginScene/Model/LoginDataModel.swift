//
//  LoginDataModel.swift
//  mission-1
//
//  Created by 장혜령 on 2021/05/13.
//

import Foundation

// MARK: - Welcome
struct LoginDataModel: Codable {
    let success: Bool
    let message: String
    let data: UserData? // 성공, 실패에 따라 값이 있을 수도 없을 수도 있기 때문
    
    enum CondingKeys: String, CodingKey {
        case success
        case message
        case data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(UserData.self, forKey: .data )) ?? nil
        
    }
    
}

// MARK: - DataClass
struct UserData: Codable {
    let userID: Int
    let userNickname, token: String

    enum CodingKeys: String, CodingKey {
        case userID = "UserId"
        case userNickname = "user_nickname"
        case token
    }
}
