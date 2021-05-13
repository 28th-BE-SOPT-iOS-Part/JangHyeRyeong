//
//  NetworkResult.swift
//  seminar_4_practise
//
//  Created by 장혜령 on 2021/05/12.
//

import Foundation

// 서버 통신 결과를 처리하기 위한 enum
enum NetworkResult<T>{
    case success(T)     // 서버통신 성공 시
    case requestErr(T)  // 요청 에러 발생 시
    case pathErr        // 경로 에러 발생 시
    case serverErr      // 서버의 내부적 에러가 발생시
    case networkFail    // 네트워크 연결 실패했을 시
}
