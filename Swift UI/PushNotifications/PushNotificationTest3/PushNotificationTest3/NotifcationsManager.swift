//
//  NotifcationsManager.swift
//  PushNotificationTest3
//
//  Created by Shaik Areef on 19/03/25.
//

import Foundation
import UserNotifications

@Observable class NotifcationsManager{

    private(set) var hasPermission = false
    
    func requestAuthorization() async{
        do{
            try await UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound])
        }catch{
            print("ERROR: \(error.localizedDescription)")
        }
    }
    
    func getAuthStatus() async{
        let status = await UNUserNotificationCenter.current().notificationSettings()
        switch status.authorizationStatus{
        case .authorized, .provisional, .ephemeral:
            hasPermission = true
        default:
            hasPermission = false
        }
    }
}

