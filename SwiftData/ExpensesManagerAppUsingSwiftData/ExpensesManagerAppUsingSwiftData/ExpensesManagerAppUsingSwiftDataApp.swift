//
//  ExpensesManagerAppUsingSwiftDataApp.swift
//  ExpensesManagerAppUsingSwiftData
//
//  Created by Shaik Areef on 13/03/25.
//

import SwiftUI
import SwiftData
@main
struct ExpensesManagerAppUsingSwiftDataApp: App {
    
//    let container: ModelContainer = {
//        let schema = Schema([ExpenseModel.self])
//        let container = try! ModelContainer(for: schema, configurations: [])
//        return container
//    }()
    
    var body: some Scene {
        WindowGroup {
            ExpensesView()
        }
//        .modelContainer(container)
        .modelContainer(for: [ExpenseModel.self])
    }
}
