//
//  EventReviewUseCase.swift
//  MoyaFrameworkReviewScreen
//
//  Created by Shaik Areef on 28/02/25.
//

import Foundation
import Moya

enum eventsAPI {
    case verificationCode
    case token(verificationCode: String)
    case getDetails(EventId:Int , token: String)
}

extension eventsAPI: TargetType {
    
    var baseURL: URL {
        URL(string: "https://api-stage.tenmates.app")!
    }
    
    var path: String {
        switch self {
        case .verificationCode:
            return "/verifications/verify_sms_code"
        case .token:
            return "/oauth/token"
        case .getDetails(let eventId , _):
            return "/events/\(eventId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .verificationCode, .token:
            return .post
        case .getDetails:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .verificationCode:
            let params = [
                "code": "123456",
                "country_code": 91,
                "mobile_number": 8300004515,
                "region_code": "IN"
            ] as [String : Any]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
            
        case .token(let verificationCode):
            let params: [String: Any] = [
                "client_id": "gYanhpa87VxQqkJ-7J8fOy5ehRLvkdat6uWbtjpFUtQ",
                "client_secret": "Wj9wd0jWkCVEPt2hKk3IK2QjUOy3fTMFzzykxRH0PDU",
                "username": 8300004515,
                "verification_code": verificationCode,
                "grant_type": "password"
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.httpBody)
            
        case .getDetails:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .verificationCode, .token:
            return [:]
            
        case .getDetails(_ , let token):
            return [
                "Authorization": "Bearer \(token)",
                "Accept": "application/vnd.prasthana.com; version=1"
            ]
        }
    }
}

extension MoyaProvider {
    func request(_ target: Target) async throws -> Response {
        return try await withCheckedThrowingContinuation { continuation in
            self.request(target) { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: response)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
