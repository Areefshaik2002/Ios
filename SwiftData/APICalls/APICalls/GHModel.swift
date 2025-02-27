//
//  GHModel.swift
//  APICalls
//
//  Created by Shaik Areef on 26/02/25.
//

import Foundation

struct GitHubUser: Decodable {
    let id: Int?
    let login: String?
    let name: String?
    let avatarUrl: String?
    let bio: String?
    let followers: Int?
    let following: Int?
    let createdAt: String?
    let updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case name
        case avatarUrl = "avatar_url"
        case bio
        case followers
        case following
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

