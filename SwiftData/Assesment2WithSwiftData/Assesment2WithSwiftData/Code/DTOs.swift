//
//  DTOs.swift
//  Assesment2WithSwiftData
//
//  Created by Shaik Areef on 17/03/25.
//
import Foundation

struct UserModelElementDTO: Decodable {
    let id: Int
    let name: String
    let email: String
    let gender: Gender?
    let status: Status?
    
    func toUserModelElement() -> UserModelElement {
        return UserModelElement(id: id, name: name, email: email, gender: gender, status: status)
    }
}

struct CommentModelElementDTO: Decodable {
    let postID: Int
    let id: Int
    let name: String
    let email: String
    let body: String
    
    func toCommentModelElement() -> CommentModelElement {
        return CommentModelElement(postID: postID, id: id, name: name, email: email, body: body)
    }
}

