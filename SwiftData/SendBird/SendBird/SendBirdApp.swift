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
            ChatListView(channelURL: "CHANNEL_URL")
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
            if let error = error {
                print("Sendbird Initialization Error: \(error.localizedDescription)")
            }
        }
    }

    func setupCurrentUser() {
        let userId = "Areefshaik2002"
        let accessToken = "5357afa07c1e4e7d2e48c5f21c5e24a42e6ea16e"
        SBUGlobals.currentUser = SBUUser(userId: userId)
        SBUGlobals.accessToken = accessToken
    }

    func handleSendbirdUiMode() {
        let theme: SBUTheme = (UITraitCollection.current.userInterfaceStyle == .dark) ? .dark : .light
        SBUTheme.componentTheme.barItemTintColor = .appPrimary
        SBUTheme.set(theme: theme)

        DispatchQueue.main.async {
            NotificationCenter.default.post(name: Notification.Name("SBUThemeDidChange"), object: nil)
        }
    }
}
