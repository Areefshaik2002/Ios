//
//  StatemanagementTutorialApp.swift
//  StatemanagementTutorial
//
//  Created by Shaik Areef on 12/02/25.
//

import SwiftUI

@main
struct StatemanagementTutorialApp: App {
    @StateObject private var feelModel = FeedModel()
    var body: some Scene {
        WindowGroup {
            ProfileView()
                .environmentObject(feelModel)
        }
    }
}
