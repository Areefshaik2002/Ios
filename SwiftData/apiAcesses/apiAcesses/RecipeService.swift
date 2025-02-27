//
//  APIService.swift
//  apiAcesses
//
//  Created by Shaik Areef on 26/02/25.
//
import Moya
import Foundation

enum RecipeService {
    case searchRecipe(recipeName: String)
}

extension RecipeService: TargetType {
    var baseURL: URL{
        return URL(string: "https://www.themealdb.com/api/json/v1/1")!
    }
    
    var path: String {
        return "/search.php"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .searchRecipe(let recipeName):
            return .requestParameters(parameters: ["s": recipeName], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}

