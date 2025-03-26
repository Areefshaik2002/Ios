//
//  ContentView.swift
//  SendBird
//
//  Created by Shaik Areef on 19/03/25.
//
import UIKit
import SwiftUI
import SendbirdSwiftUI
import SendbirdChatSDK

struct ChatListView: View {
    @StateObject var provider = GroupChannelListViewProvider()
    @StateObject private var themeManager = ThemeManager.shared

    init() {
        let params = GroupChannelListQueryParams()
        params.order = .channelNameAlphabetical

        let channelListQuery = GroupChannel.createMyGroupChannelListQuery(params: params)
        _provider = StateObject(wrappedValue: GroupChannelListViewProvider(channelListQuery: channelListQuery))

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.label]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.label]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        GroupChannelListView(
            provider: provider,
            listItem: {
                .init()
                .rowView { viewConfig in
                    ChatRowView(viewConfig: viewConfig)
                }
            }
        )
        .background(Color(.systemBackground))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    themeManager.toggleTheme()
                }) {
                    Image(systemName: themeManager.isDarkMode ? "sun.max.fill" : "moon.fill")
                        .foregroundColor(themeManager.isDarkMode ? .white : .black)
                }
            }
        }
        .onAppear {
            themeManager.applyTheme()
        }
    }

    private func formatTimestamp(_ timestamp: Int64) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp) / 1000)
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: date)
    }
}

struct ChatRowView: View {
    let viewConfig: GroupChannel
    @ObservedObject private var themeManager = ThemeManager.shared
    
    var body: some View {
        HStack(spacing: 12) {
            if let url = viewConfig.coverURL {
                AsyncImage(url: URL(string: url)) { image in
                    image.resizable()
                } placeholder: {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .foregroundColor(.init(red: 193/255, green: 215/255, blue: 46/255).opacity(0.5))
                }
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(.leading, 12)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(viewConfig.name)
                        .font(.headline)
                        .foregroundColor(themeManager.isDarkMode ? .white : .black)
                    
                    Spacer()
                    
                    if let lastMessage = viewConfig.lastMessage {
                        Text(formatTimestamp(lastMessage.createdAt))
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Text(viewConfig.lastMessage?.message ?? "No messages yet")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            
            if viewConfig.unreadMessageCount > 0 {
                Text("\(viewConfig.unreadMessageCount)")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.red)
                    .clipShape(Circle())
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(themeManager.isDarkMode ? Color.black : Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.init(red: 193/255, green: 215/255, blue: 46/255).opacity(0.5), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    private func formatTimestamp(_ timestamp: Int64) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp) / 1000)
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: date)
    }
}





//headerItem: {
//    .init()
//    .leftView{ viewConfig in
//        Text("Chats")
//            .font(.largeTitle)
//            .fontWeight(.bold)
//            .foregroundColor(Color.black)
//
//    }
//    .titleView{ viewConfig in
//        Text("")
//    }
//    .rightView { viewConfig in
//        HStack(spacing: 8){
//            Button(action: {
//                print("Plus button tapped!")
//            }) {
//                Image(systemName: "questionmark.circle")
//                    .resizable()
//                    .frame(width: 24, height: 24)
//                    .foregroundColor(.init(red: 193/255, green: 215/255, blue: 46/255))
//            }
//
//            Button(action: {
//                print("Plus button tapped!")
//            }) {
//                Image(systemName: "plus")
//                    .resizable()
//                    .frame(width: 24, height: 24)
//                    .foregroundColor(.init(red: 193/255, green: 215/255, blue: 46/255))
//            }
//        }
//    }
//}
