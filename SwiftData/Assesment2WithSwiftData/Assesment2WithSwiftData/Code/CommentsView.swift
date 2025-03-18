//
//  ContentView.swift
//  Assesment2WithSwiftData
//
//  Created by Shaik Areef on 17/03/25.
//

import SwiftUI

struct CommentsView: View {
    @State var viewModel: ViewModel

    var body: some View {
        List {
            ForEach(viewModel.comments, id: \.id) { comment in
                NavigationLink(destination: commentsDetailView(comment: comment)) {
                    commentRowView(comment: comment)
                }
            }
        }
        .navigationTitle("Comments List")
        .task {
            await viewModel.getData()
        }
    }
    
    func commentRowView(comment: CommentModelElement) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Name: \(comment.name)")
            Text("Email: \(comment.email)")
        }
    }
    
    func commentsDetailView(comment: CommentModelElement) -> some View {
        List {
            Text("ID: \(comment.id)")
            Text("Name: \(comment.name)")
            Text("Email: \(comment.email)")
            Text("Comment: \(comment.body)")
            Text("On postID: \(comment.postID)")
        }
        .navigationTitle("Comment Details")
    }
}
