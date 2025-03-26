import UIKit
import SendbirdSwiftUI
import SendbirdChatSDK
import SwiftUI
import SendbirdUIKit

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
        let theme = SBUTheme()

        // Configure navigation bar appearance
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = isDarkMode ? UIColor.black : UIColor.white
        appearance.titleTextAttributes = [.foregroundColor: isDarkMode ? UIColor.white : UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: isDarkMode ? UIColor.white : UIColor.black]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        // Configure SendBird theme
        if isDarkMode {
            SBUTheme.setThemeMode(.dark)
            let darkTheme = SBUTheme.default
            darkTheme.backgroundColor = UIColor.black
            darkTheme.channelBackgroundColor = UIColor.black
            darkTheme.messageListBackgroundColor = UIColor.black
            darkTheme.messageInputBackgroundColor = UIColor.black
            SBUTheme.setTheme(darkTheme, for: .dark)
        } else {
            SBUTheme.setThemeMode(.light)
            let lightTheme = SBUTheme.default
            lightTheme.backgroundColor = UIColor.white
            lightTheme.channelBackgroundColor = UIColor.white
            lightTheme.messageListBackgroundColor = UIColor.white
            lightTheme.messageInputBackgroundColor = UIColor.white
            SBUTheme.setTheme(lightTheme, for: .light)
        }
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
    }
}

#Preview {
    ChatDetailView()
}

class ThemeManager: ObservableObject {
    @Published var isDarkMode: Bool = false
    
    static let shared = ThemeManager()
    
    private init() {
        // Initialize with system theme
        isDarkMode = UITraitCollection.current.userInterfaceStyle == .dark
    }
    
    func toggleTheme() {
        isDarkMode.toggle()
        applyTheme()
    }
    
    func applyTheme() {
        // Configure SendBird UIKit theme
        let theme = SBUTheme()
        
        // Configure navigation bar appearance
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = isDarkMode ? UIColor.black : UIColor.white
        appearance.titleTextAttributes = [.foregroundColor: isDarkMode ? UIColor.white : UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: isDarkMode ? UIColor.white : UIColor.black]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        // Configure SendBird theme
        if isDarkMode {
            SBUTheme.setThemeMode(.dark)
            let darkTheme = SBUTheme.default
            darkTheme.backgroundColor = UIColor.black
            darkTheme.channelBackgroundColor = UIColor.black
            darkTheme.messageListBackgroundColor = UIColor.black
            darkTheme.messageInputBackgroundColor = UIColor.black
            SBUTheme.setTheme(darkTheme, for: .dark)
        } else {
            SBUTheme.setThemeMode(.light)
            let lightTheme = SBUTheme.default
            lightTheme.backgroundColor = UIColor.white
            lightTheme.channelBackgroundColor = UIColor.white
            lightTheme.messageListBackgroundColor = UIColor.white
            lightTheme.messageInputBackgroundColor = UIColor.white
            SBUTheme.setTheme(lightTheme, for: .light)
        }
    }
}
