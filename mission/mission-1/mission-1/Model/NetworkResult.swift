//
//  NetworkResult.swift
//  mission-1
//
//  Created by 장혜령 on 2021/05/13.
//

import Foundation

enum NetworkResult<T>{
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
