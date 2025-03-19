//
//  PushNotificationTestApp.swift
//  PushNotificationTest
//
//  Created by Shaik Areef on 18/03/25.
//

import SwiftUI

@main
struct PushNotificationTestApp: App {
    
    @StateObject var notificationManager = NotificationManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(notificationManager)
                .onAppear {
                    notificationManager.requestAuthorization()
                    notificationManager.registerForPushNotifications()
                }
        }
    }
}
