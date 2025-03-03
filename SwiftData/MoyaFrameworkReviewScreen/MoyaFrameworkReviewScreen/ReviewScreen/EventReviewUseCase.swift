//
//  EventReviewUseCase.swift
//  MoyaFrameworkReviewScreen
//
//  Created by Shaik Areef on 28/02/25.
//

import Foundation
import Moya

enum EventReviewUseCase {
    case getVerificationCode(mobileNumber: Int, countryCode: Int, regionCode: String)
    case getToken(username: String, verification_code: String)
    case getData(eventId: Int)
}

extension EventReviewUseCase: TargetType {
    var baseURL: URL {
        return URL(string: "https://api-stage.tenmates.app")!
    }

    var path: String {
        switch self {
        case .getVerificationCode:
            return "verifications/verify_sms_code"
        case .getToken:
            return "oauth/token"
        case .getData(let eventId):
            return "/events/\(eventId)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getVerificationCode, .getToken:
            return .post
        case .getData:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .getVerificationCode(let mobileNumber, let countryCode, let regionCode):
            return .requestParameters(
                parameters: [
                    "code": "123456",
                    "country_code": countryCode,
                    "mobile_number": mobileNumber,
                    "region_code": regionCode
                ],
                encoding: JSONEncoding.default
            )
        case .getToken(let username, let verificationCode):
            return .requestParameters(
                parameters: [
                    "client_id": "gYanhpa87VxQqkJ-7J8fOy5ehRLvkdat6uWbtjpFUtQ",
                    "client_secret": "Wj9wd0jWkCVEPt2hKk3IK2QjUOy3fTMFzzykxRH0PDU",
                    "username": username,
                    "grant_type": "password",
                    "verification_code": verificationCode
                ],
                encoding: JSONEncoding.default
            )
        case .getData:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        switch self {
        case .getVerificationCode, .getToken:
            return ["Accept": "*/*"]
        case .getData:
            return [
                "Accept": "application/vnd.prasthana.com; version=1"
            ]
        }
    }
}
