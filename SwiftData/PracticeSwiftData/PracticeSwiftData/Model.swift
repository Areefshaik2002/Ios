//
//  Model.swift
//  PracticeSwiftData
//
//  Created by Shaik Areef on 17/03/25.
//

import Foundation
import SwiftData

@Model
class DataModel{
    var postId: Int?
    var id: Int?
    var name: String?
    var email: String?
    var body: String?
    
    init(postId: Int? = nil, id: Int? = nil, name: String? = nil, email: String? = nil, body: String? = nil) {
        self.postId = postId
        self.id = id
        self.name = name
        self.email = email
        self.body = body
    }
}


struct CommentModelElement: Codable {
    var postID, id: Int?
    var name, email, body: String?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}

typealias CommentModel = [CommentModelElement]


