//
//  SendBirdTaskApp.swift
//  SendBirdTask
//
//  Created by Shaik Areef on 24/03/25.
//

import SwiftUI
import SendbirdSwiftUI

@main
struct MyApp: App {
    init() {
        setupSendbird()
        setupCurrentUser()
    }
    
    var body: some Scene {
        WindowGroup {
            ChatListView()
        }
    }
}

private extension MyApp {
    func setupSendbird() {
        let APP_ID = "3DBF8F23-FDD5-4300-A00D-0A8701FA6CA5"    // Specify your Sendbird application ID.
        
        SendbirdUI.initialize(
            applicationId: APP_ID
        ) { params in
            // This is the builder block where you can modify the initParameter.
            //
            // [example]
            // params.needsSynchronous = false
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
        SBUGlobals.currentUser = SBUUser(userId: "test_user")
        SBUGlobals.accessToken = "c79c8da4323a441b64a9d4609c766af45038140f"
    }
    
}
