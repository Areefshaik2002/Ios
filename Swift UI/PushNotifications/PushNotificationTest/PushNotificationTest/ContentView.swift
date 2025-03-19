//
//  ContentView.swift
//  PushNotificationTest
//
//  Created by Shaik Areef on 18/03/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var notificationManager: NotificationManager
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    Text("Push Notification Demo")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                        .shadow(radius: 10)
                    
                    Image(systemName: "bell.badge.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.yellow)
                        .shadow(radius: 5)
                }
                .padding()
            }
            .navigationBarHidden(true)
            .navigationDestination(
                isPresented: Binding<Bool>(
                    get: { notificationManager.navigateToMessage != nil },
                    set: { if !$0 { notificationManager.navigateToMessage = nil } }
                )
            ) {
                if let messageId = notificationManager.navigateToMessage {
                    MessageView(messageId: messageId)
                }
            }
        }
    }
}


struct MessageView: View {
    let messageId: String
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.red, Color.blue]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Message Detail")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.top, 24)
                
                Text("Message ID: \(messageId)")
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
