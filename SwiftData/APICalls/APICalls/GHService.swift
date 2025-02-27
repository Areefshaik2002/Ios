//
//  GHService.swift
//  APICalls
//
//  Created by Shaik Areef on 26/02/25.
//

import Foundation
import Moya

enum GHService {
    case getDetailsOfUser(user: String)
}

extension GHService: TargetType{
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
            switch self {
            case .getDetailsOfUser(let userName):
                return "/users/\(userName)"  
            }
        }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self{
        case .getDetailsOfUser:
            return .requestPlain
        }
        
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
