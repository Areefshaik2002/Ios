//
//  ViewModel.swift
//  PracticeSwiftData
//
//  Created by Shaik Areef on 17/03/25.
//

import Foundation
import Moya

@Observable class CommentViewModel {
    
    var comments: CommentModel?
        
    func getData() async {
        do {
            comments = try await getCommentDetails()
        } catch {
            print("Error fetching data: \(error)")
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
