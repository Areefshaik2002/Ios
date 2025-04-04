//
//  SendBirdApp.swift
//  SendBird
//
//  Created by Shaik Areef on 19/03/25.
//

import SwiftUI
import SendbirdSwiftUI

@main
struct SendBirdApp: App {
    @Environment(\.colorScheme) var colorScheme

    init() {
        setupSendbird()
        setupCurrentUser()
    }
    
    var body: some Scene {
        WindowGroup {
            ChatListView()
                .onAppear {
                    handleSendbirdUiMode()
                }
        }
    }
}

private extension SendBirdApp {
    func setupSendbird() {
        let APP_ID = "3DBF8F23-FDD5-4300-A00D-0A8701FA6CA5" 

        SendbirdUI.initialize(applicationId: APP_ID) { params in
            // Customize initialization if needed
        } startHandler: {
            // Show loading indicator
        } migrationHandler: {
            // Handle DB migration if needed
        } completionHandler: { error in
            // Hide loading indicator
        }
    }

    func setupCurrentUser() {
        SBUGlobals.currentUser = SBUUser(userId: "Ajay Ganji")
        SBUGlobals.accessToken = "0b223d4ecb64c9f5e4b313398cf6762b07b979e8"
    }

    func handleSendbirdUiMode() {
        let theme: SBUTheme = (UITraitCollection.current.userInterfaceStyle == .dark) ? SBUTheme.dark : SBUTheme.light
        SBUTheme.componentTheme.barItemTintColor = .green 
        SBUTheme.set(theme: theme)

        DispatchQueue.main.async {
            NotificationCenter.default.post(name: Notification.Name("SBUThemeDidChange"), object: nil)
        }
    }

}
