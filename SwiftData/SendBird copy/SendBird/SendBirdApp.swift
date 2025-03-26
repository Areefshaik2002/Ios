//
//  SendBirdApp.swift
//  SendBird
//
//  Created by Shaik Areef on 19/03/25.
//

import SwiftUI
import SendbirdSwiftUI
import SendbirdUIKit

@main
struct SendBirdApp: App {
    init() {
        setupSendbird()
        setupCurrentUser()
        setupTheme()
    }
    
    var body: some Scene {
        WindowGroup {
            ChatListView()
        }
    }
}

private extension SendBirdApp {
    func setupSendbird() {
        let APP_ID = "3DBF8F23-FDD5-4300-A00D-0A8701FA6CA5"    // Specify your Sendbird application ID.
        
        SendbirdUI.initialize(
            applicationId: APP_ID
        ) { params in
            // This is the builder block where you can modify the initParameter.
            params.needsSynchronous = false
        } startHandler: {
            // Initialization of SendbirdSwiftUI has started.
            // We recommend showing a loading indicator once started.
        } migrationHandler: {
            // DB migration has started.
        } completionHandler: { error in
            // If DB migration is successful, proceed to the next step.
            // If DB migration fails, an error exists.
            // We recommend hiding the loading indicator once done.
        }
    }
    
    func setupCurrentUser() {
        // Set current user.
        SBUGlobals.currentUser = SBUUser(userId: "Areefshaik2002")
        SBUGlobals.accessToken = "42756eca82f09e85bd4e78bab507be3eb6f3bf2e"
    }
    
    func setupTheme() {
        // Configure theme for dark mode support
        SBUTheme.setThemeMode(.system)
        SBUTheme.setTheme(theme: .default, for: .light)
        SBUTheme.setTheme(theme: .default, for: .dark)
    }
}
