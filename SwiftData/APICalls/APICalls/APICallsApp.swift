//
//  APICallsApp.swift
//  APICalls
//
//  Created by Shaik Areef on 18/02/25.
//

import SwiftUI

@main
struct APICallsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: GHViewModel())
        }
    }
}
