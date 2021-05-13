//
//  PersonDataModel.swift
//  seminar_4
//
//  Created by 장혜령 on 2021/05/08.
//

import Foundation

// MARK: - PersonDataModel
struct PersonDataModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: Person
}

// MARK: - Person
struct Person: Codable {
    let name, profileMessage: String

    enum CodingKeys: String, CodingKey {
        case name
        case profileMessage = "profile_message"
    }
}
