//
//  Assesment2WithSwiftDataApp.swift
//  Assesment2WithSwiftData
//
//  Created by Shaik Areef on 17/03/25.
//

import SwiftUI
import SwiftData

@main
struct Assesment2WithSwiftDataApp: App {
    var sharedModelContainer: ModelContainer

    init() {
        let schema = Schema([UserModelElement.self, CommentModelElement.self])
        let config = ModelConfiguration(schema: schema)
        self.sharedModelContainer = try! ModelContainer(for: schema, configurations: [config])
    }

    var body: some Scene {
        WindowGroup {
            let modelContext = sharedModelContainer.mainContext
            UsersView(viewModel: ViewModel(modelContext: modelContext))
                .modelContainer(sharedModelContainer)
        }
    }
}
