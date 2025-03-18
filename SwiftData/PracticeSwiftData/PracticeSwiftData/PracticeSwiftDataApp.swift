//
//  PracticeSwiftDataApp.swift
//  PracticeSwiftData
//
//  Created by Shaik Areef on 17/03/25.
//

import SwiftUI
import SwiftData

@main
struct PracticeSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            CommentsView(viewModel: CommentViewModel())
        }
        .modelContainer(for: [DataModel.self])
    }
}
