//
//  ViewModel.swift
//  Assesment2WithSwiftData
//
//  Created by Shaik Areef on 17/03/25.
//

import Foundation
import SwiftData
import Moya

@Observable
class ViewModel {
    private let provider = MoyaProvider<commentsAndUsersAPI>()
    var modelContext: ModelContext
    
   /* @MainActor*/ var users: [UserModelElement] = []
  /*  @MainActor*/ var comments: [CommentModelElement] = []
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func getData() async {
        do {
            let fetchedUsers = try await getUserDetails()
            let fetchedComments = try await getCommentDetails()
            
            /*await*/ saveUsersToDatabase(users: fetchedUsers)
            /*await*/ saveCommentsToDatabase(comments: fetchedComments)
            
            /*await*/ fetchFromDatabase()
        } catch {
            print("Error fetching data: \(error)")
        }
    }
    
    func getUserDetails() async throws -> [UserModelElement] {
        let response = try await provider.request(.getUsers)
        guard response.statusCode == 200 else { throw URLError(.badServerResponse) }
        
        let userDTOs = try JSONDecoder().decode([UserModelElementDTO].self, from: response.data)
        return userDTOs.map { $0.toUserModelElement() }
    }

    func getCommentDetails() async throws -> [CommentModelElement] {
        let response = try await provider.request(.getComments)
        guard response.statusCode == 200 else { throw URLError(.badServerResponse) }
        
        let commentDTOs = try JSONDecoder().decode([CommentModelElementDTO].self, from: response.data)
        return commentDTOs.map { $0.toCommentModelElement() }
    }

//    @MainActor
    func saveUsersToDatabase(users: [UserModelElement]) {
        for user in users {
            modelContext.insert(user)
        }
    }
    
//    @MainActor
    func saveCommentsToDatabase(comments: [CommentModelElement]) {
        for comment in comments {
            modelContext.insert(comment)
        }
    }
    
//    @MainActor
    func fetchFromDatabase() {
        let userFetchDescriptor = FetchDescriptor<UserModelElement>()
        let commentFetchDescriptor = FetchDescriptor<CommentModelElement>()
        
        do {
            users = try modelContext.fetch(userFetchDescriptor)
            comments = try modelContext.fetch(commentFetchDescriptor)
        } catch {
            print("Error fetching from database: \(error)")
        }
    }
}
