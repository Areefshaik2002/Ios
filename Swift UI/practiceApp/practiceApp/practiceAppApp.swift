//
//  practiceAppApp.swift
//  practiceApp
//
//  Created by Shaik Areef on 11/03/25.
//

import SwiftUI

@main
struct practiceAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: EventViewModel())
        }
    }
}
