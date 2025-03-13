//
//  CommentViewModel.swift
//  Assesment2
//
//  Created by Shaik Areef on 12/03/25.
//

import Foundation
import Moya

@Observable class CommentViewModel {
    
    var comments: CommentModel?
    var users: UserModel?
        
    func getData() async {
        do {
            users = try await getUserDetails()
            comments = try await getCommentDetails()
        } catch {
            print("Error fetching data: \(error)")
        }
    }
    
    func getUserDetails() async throws -> UserModel {
        let provider = MoyaProvider<commentsAndUsersAPI>()
        let response = try await provider.request(.getusers)
        guard response.statusCode == 200 else { throw URLError(.badServerResponse) }
        do {
            let users = try JSONDecoder().decode(UserModel.self, from: response.data)
//            print(response.statusCode)
//            print(users)
            return users
        } catch {
            throw error
        }
    }
    
    func getCommentDetails() async throws -> CommentModel {
        let provider = MoyaProvider<commentsAndUsersAPI>()
        let response = try await provider.request(.getComments)
        guard response.statusCode == 200 else { throw URLError(.badServerResponse) }
        do {
            let comments = try JSONDecoder().decode(CommentModel.self, from: response.data)
//            print(response.statusCode)
//            print(comments)
            return comments
        } catch {
            throw error
        }
    }
}
