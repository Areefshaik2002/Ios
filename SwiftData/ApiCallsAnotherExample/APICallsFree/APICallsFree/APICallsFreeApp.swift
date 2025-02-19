//
//  APICallsFreeApp.swift
//  APICallsFree
//
//  Created by Shaik Areef on 18/02/25.
//

import SwiftUI

@main
struct APICallsFreeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

//import SwiftUI
//import SwiftData
//
//@main
//struct APICallsApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([Meal.self])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//        return try! ModelContainer(for: schema, configurations: [modelConfiguration])
//    }()
//    
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .modelContainer(sharedModelContainer) // Attach SwiftData container
//        }
//    }
//}
