//
//  NewUserUseCase.swift
//  NewUserCreation
//
//  Created by Shaik Areef on 03/03/25.
//

import Foundation
import Moya

enum UsersAPI {
    case verificationCode
    case token(verificationCode: String)
    case addUser(mobileNumber: String, firstName: String, lastName: String, /*roles: [String],*/ countryId: Int, regionCode: String, token: String)
}

extension UsersAPI: TargetType {
    var baseURL: URL {
        URL(string: "https://api-stage.tenmates.app")!
    }
    
    var path: String {
        switch self {
        case .verificationCode:
            return "/verifications/verify_sms_code"
        case .token:
            return "/oauth/token"
        case .addUser:
            return "/users"
        }
    }
    
    var method: Moya.Method {
        return .post
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
                "username": "8300004515",
                "verification_code": verificationCode,
                "grant_type": "password"
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.httpBody)
            
        case .addUser(let mobileNumber, let firstName, let lastName, /*let roles,*/ let countryId, let regionCode, _):
            let params: [String: Any] = [
                "user[mobile_number]": mobileNumber,
                "user[first_name]": firstName,
                "user[last_name]": lastName,
                "user[country_id]": countryId,
                "roles[]": "ur_player",
                "region_code": regionCode
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.httpBody)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .verificationCode, .token:
            return [:]
        case .addUser(_, _, _, _, _, /*_,*/ let token):
            return [
                "Authorization": "Bearer \(token)",
                "Accept": "application/vnd.prasthana.com; version=1",
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
