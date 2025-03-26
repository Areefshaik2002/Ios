//
//  DisplayChannelView.swift
//  SendBird
//
//  Created by Shaik Areef on 19/03/25.
//
import UIKit
import SendbirdSwiftUI
import SendbirdChatSDK
import SwiftUI

class CustomChatViewController: SBUGroupChannelViewController {

    // Track the current theme state
    private var isDarkMode = true

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTheme()
        
        // Create a button to toggle themes
        let themeToggleButton = UIBarButtonItem(title: "Toggle Theme", style: .plain, target: self, action: #selector(themeSwitchTapped))
        self.navigationItem.rightBarButtonItem = themeToggleButton
    }

    // Toggle between dark and light themes
    func toggleTheme() {
        isDarkMode.toggle()
        setupTheme()
    }

    private func setupTheme() {
        let theme = SBUChannelTheme()

        if isDarkMode {
            // Dark Mode Theme Customizations
            theme.backgroundColor = .black
            theme.channelTitleColor = .white  // Change channel title color
        } else {
            // Light Mode Theme Customizations
            theme.backgroundColor = .white
            theme.channelTitleColor = .black  // Change channel title color
        }

        // Apply the theme to the chat UI
        SBUTheme.channelTheme = theme
    }

    // Example: Button action to toggle themes
    @objc func themeSwitchTapped() {
        toggleTheme()
    }
}

struct ChatDetailView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var themeManager = ThemeManager.shared
    
    var body: some View {
        GroupChannelView(provider: GroupChannelViewProvider(channelURL: "CHANNEL_URL"))
            .preferredColorScheme(themeManager.isDarkMode ? .dark : .light)
            .background(themeManager.isDarkMode ? Color.black : Color.white)
            .onAppear {
                themeManager.applyTheme()
            }
            .ignoresSafeArea()
    }
}

#Preview {
    ChatDetailView()
}
