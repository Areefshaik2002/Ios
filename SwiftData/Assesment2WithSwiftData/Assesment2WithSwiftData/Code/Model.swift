//
//  Model.swift
//  Assesment2WithSwiftData
//
//  Created by Shaik Areef on 17/03/25.
//

import SwiftData

@Model
class UserModelElement {
    var id: Int
    var name: String
    var email: String
    var gender: Gender?
    var status: Status?
    
    init(id: Int, name: String, email: String, gender: Gender?, status: Status?) {
        self.id = id
        self.name = name
        self.email = email
        self.gender = gender
        self.status = status
    }
}

@Model
class CommentModelElement {
    var postID: Int
    var id: Int
    var name: String
    var email: String
    var body: String

    init(postID: Int, id: Int, name: String, email: String, body: String) {
        self.postID = postID
        self.id = id
        self.name = name
        self.email = email
        self.body = body
    }
}
