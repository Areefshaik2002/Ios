//
//  CommentModel.swift
//  Assesment2
//
//  Created by Shaik Areef on 12/03/25.
//

import Foundation

struct CommentModelElement: Codable {
    var postID, id: Int?
    var name, email, body: String?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}

typealias CommentModel = [CommentModelElement]

struct UserModelElement: Codable {
    let id: Int?
    let name, email: String?
    let gender: Gender?
    let status: Status?
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

enum Status: String, Codable {
    case active = "active"
    case inactive = "inactive"
}

typealias UserModel = [UserModelElement]

