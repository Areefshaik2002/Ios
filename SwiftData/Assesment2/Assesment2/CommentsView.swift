//
//  ContentView.swift
//  Assesment2
//
//  Created by Shaik Areef on 12/03/25.
//

import SwiftUI

struct CommentsView: View {
    var viewModel: CommentViewModel
    var body: some View {
        List {
            ForEach(viewModel.comments ?? [], id: \.id){ comment in
                NavigationLink(destination: commentsDetailView(comment: comment)){
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
            Text("Name: \(comment.name ?? "")")
            Text("Email: \(comment.email ?? "")")
        }
    }
    
    func commentsDetailView(comment: CommentModelElement) -> some View {
        NavigationView {
            List {
                Text("id: \(comment.id ?? 0)")
                Text("Name: \(comment.name ?? "")")
                Text("Email: \(comment.email ?? "")")
                Text("Comment: \(comment.body ?? "")")
                Text("On postId: \(comment.postID ?? 0)")
            }
            .padding(.top, 12)
            .navigationTitle("Comment details")
        }
    }
}

#Preview {
    CommentsView(viewModel: CommentViewModel())
}
//
//struct CommentRowView: View {
//    var comment: CommentModelElement
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8){
//            Text("Name: \(comment.name ?? "")")
//            Text("Email: \(comment.email ?? "")")
//        }
//    }
//}
//
//struct CommentsDetailView: View {
//    var comment: CommentModelElement
//    var body: some View {
//        NavigationView{
//            List{
//                Text("id: \(comment.id ?? 0)")
//                Text("Name: \(comment.name ?? "")")
//                Text("Email: \(comment.email ?? "")")
//                Text("Comment: \(comment.body ?? "")")
//                Text("On postId: \(comment.postID ?? 0)")
//            }
//            .padding(.top, 12)
//            .navigationTitle("Comment details")
//        }
//    }
//}
