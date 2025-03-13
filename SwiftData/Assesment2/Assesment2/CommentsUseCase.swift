//
//  CommentsUseCase.swift
//  Assesment2
//
//  Created by Shaik Areef on 12/03/25.
//

import Foundation
import Moya

enum commentsAndUsersAPI{
    case getusers
    case getComments
}

extension commentsAndUsersAPI: TargetType {
    
    public var baseURL: URL {
        switch self{
        case .getusers:
            URL(string: "https://gorest.co.in/public/v2")!
        case .getComments:
            URL(string: "https://jsonplaceholder.typicode.com")!
        }
    }
    
    public var path: String {
        switch self {
        case .getusers:
            return "/users"
        case .getComments:
            return "/comments"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getComments, .getusers:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getComments, .getusers:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getComments, .getusers:
            return [:]
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


