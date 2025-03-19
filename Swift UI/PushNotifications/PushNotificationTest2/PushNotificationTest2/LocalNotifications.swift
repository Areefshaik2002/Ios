//
//  LocalNotifications.swift
//  PushNotificationTest2
//
//  Created by Shaik Areef on 19/03/25.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager{
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options : UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotifcations(){
        let content = UNMutableNotificationContent()
        content.title = "Hello User!"
        content.subtitle = "This is a test notification."
        content.sound = .default
        content.badge = 1
        
//        Time based
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        //calender based
//        var dateComponents = DateComponents()
//        dateComponents.hour = 10
//        dateComponents.minute = 27
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        //Location based
//        let coordinates = CLLocationCoordinate2D(latitude: 16.7748, longitude: -80.623485)
//        let region = CLCircularRegion(
//            center: coordinates,
//            radius: 100,
//            identifier: UUID().uuidString)
//        region.notifyOnEntry = true
//        region.notifyOnExit = true
//        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
    
    func cancelNotification(){
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct LocalNotifications: View {
    var body: some View {
        VStack(spacing: 40){
            Button("Request permisson"){
                NotificationManager.instance.requestAuthorization()
            }
            Button("schedule notification"){
                NotificationManager.instance.scheduleNotifcations()
            }
            Button("cancel notification"){
                NotificationManager.instance.cancelNotification()
            }
        }
        .onAppear {
//            UIApplication.shared.applicationIconBadgeNumber = 0 ---> Depreceated in ios17
            UNUserNotificationCenter.current().setBadgeCount(0) { error in
                if let error = error {
                    print("Failed to reset badge count: \(error.localizedDescription)")
                }
            }
        }

    }
}

#Preview {
    LocalNotifications()
}
