//
//  EventReviwUseCase.swift
//  ReviewScreenWithMoya
//
//  Created by Shaik Areef on 26/02/25.
//

import Foundation
import Moya

enum EventReviewUseCase {
    case getData(eventId: Int)
}

extension EventReviewUseCase: TargetType {
    var baseURL: URL {
        return URL(string: "https://api-stage.tenmates.app")!
    }

    var path: String {
        switch self {
        case .getData(let eventId):
            return "/events/\(eventId)"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Moya.Task {
        return .requestPlain
    }

    var headers: [String: String]? {
        let accessToken = "eyJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJhY2UtYXBpIiwiaWF0IjoxNzQwNjMwNjI2LCJ0aSI6IjM3NGYxMzg1LTRiOTEtNDIzZS1hNWE1LTNkYzczNDIzYmZjMiIsInVzZXIiOnsiaWQiOjEzNDMsImVtYWlsIjpudWxsfX0.9_UDBk-teRyG795az9oeXTvakqq3tMb82t3YpJrLem_U9YlWkw_vcswG1Ba6X41iNJ4GUrKNwJJZlVLvK0K5wQ"
        return [
            "Authorization": "Bearer \(accessToken)",
            "Accept": "application/vnd.prasthana.com; version=1"
        ]
    }
}














//enum EventReviwUseCase {
//    case sendOTP(code: Int, countryCode: Int, mobileNumber: Int, regionCode: String)
//    case getAccessToken(client_id: String, client_secret: String, username: Int, grant_type: String, verification_code:String)
//    case getData(eventID: Int)
//}
//
//extension EventReviwUseCase: TargetType {
//    var baseURL: URL {
//        return URL(string: "https://api-stage.tenmates.app")!
//    }
//    
//    var path: String {
//        switch self {
//        case .sendOTP:
//            return "verifications/verify_sms_code"
//        case .getAccessToken:
//            return "/oauth/token"
//        case .getData(let eventID):
//            return "events/\(eventID)"
//        }
//    }
//    
//    var method: Moya.Method {
//        switch self{
//        case .sendOTP, .getAccessToken:
//            return .post
//        case .getData:
//            return .get
//        }
//    }
//    
//    var task: Moya.Task {
//        switch self{
//        case .sendOTP(let code, let countryCode, let mobileNumber, let regionCode):
//            return .requestParameters(
//                parameters: [
//                    "code": code,
//                    "country_code": countryCode,
//                    "mobile_number": mobileNumber,
//                    "region_code": regionCode
//                ],
//                encoding: JSONEncoding.default
//            )
//        case .getAccessToken(let client_id, let client_secret, let username, let grant_Type, let verification_code):
//            return .requestParameters(
//                parameters: [
//                    "client_id": client_id,
//                    "client_secret": client_secret,
//                    "username": username,
//                    "grant_Type": grant_Type,
//                    "verification_code":verification_code
//                ],
//                encoding: JSONEncoding.default
//            )
//        case .getData:
//            return .requestPlain
//        }
//    }
//    
//    var headers: [String: String]? {
//        switch self {
//        case .sendOTP, .getAccessToken:
//            return ["Accept": "*/*"]
//
//        case .getData:
//            return [
//                "Accept": "application/vnd.prasthana.com; version=1",
////                "Authorization": "Bearer \(authToken)"
//            ]
//        }
//    }
//
//
//}
//
