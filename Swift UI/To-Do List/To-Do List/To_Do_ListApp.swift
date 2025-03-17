//
//  To_Do_ListApp.swift
//  To-Do List
//
//  Created by Shaik Areef on 11/03/25.
//

import SwiftUI
import SwiftData

@main
struct To_Do_ListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel())
        }
        
    }
}
