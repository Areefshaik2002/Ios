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
import SendbirdUIKit

struct ChatListView: View {
    @StateObject var provider = GroupChannelListViewProvider()
    
    init() {
        UINavigationBar.appearance().tintColor = .green
    }
    
    var body: some View {
        GroupChannelListView(
            provider: provider,
            headerItem: {
                .init()
                .leftView { _ in
                    Text("Chats")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.bottom, 12)
                }
                .titleView { _ in
                    EmptyView()
                }
                .rightView { _ in
                    Button(action: {
                        provider.showCreateChannel()
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(uiColor: .init(red: 193/255, green: 215/255, blue: 46/255, alpha: 1)))
                            .padding(.trailing, 12)
                    }
                }
            },
            listItem: {
                .init()
                .rowView { viewConfig in
                    HStack(spacing: 12) {
                        if let url = viewConfig.channel.coverURL {
                            AsyncImage(url: URL(string: url)) { image in
                                image.resizable()
                            } placeholder: {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .foregroundColor(Color(uiColor: .init(red: 193/255, green: 215/255, blue: 46/255, alpha: 0.5)))
                            }
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding(.leading, 12)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(viewConfig.channel.name.isEmpty ? "Unnamed Channel" : viewConfig.channel.name)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                if let lastMessage = viewConfig.channel.lastMessage {
                                    Text(formatTimestamp(lastMessage.createdAt))
                                        .font(.caption)
                                        .foregroundColor(Color(uiColor: .secondaryLabel))
                                }
                            }
                            
                            Text(viewConfig.channel.lastMessage?.message ?? "No messages yet")
                                .font(.subheadline)
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                                .lineLimit(1)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(uiColor: .init(red: 193/255, green: 215/255, blue: 46/255, alpha: 0.5)), lineWidth: 1)
                            .background(
                                Color(uiColor: .systemBackground)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                            )
                    )
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                }
            })
    }
    
    private func formatTimestamp(_ timestamp: Int64) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp) / 1000)
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: date)
    }
}




//struct ChatListView: View {
//    @StateObject var provider = GroupChannelListViewProvider()
//    
//    init() {
//        UINavigationBar.appearance().tintColor = .green
//    }
//    
//    var body: some View {
//        NavigationStack {
//            GroupChannelListView(
//                provider: provider,
//                headerItem: {
//                    .init()                                      
//                    .leftView { _ in
//                        Text("Chats")
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//                            .foregroundColor(.primary)
//                            .padding(.bottom, 12)
//                    }
//                    .titleView { _ in
//                        EmptyView()
//                    }
//                    .rightView { _ in
//                        Button(action: {
//                            provider.showCreateChannel()
//                        }) {
//                            Image(systemName: "plus")
//                                .resizable()
//                                .frame(width: 20, height: 20)
//                                .foregroundColor(Color(uiColor: .init(red: 193/255, green: 215/255, blue: 46/255, alpha: 1)))
//                                .padding(.trailing, 12)
//                        }
//                    }
//                },
//                listItem: {
//                    .init()
//                    .rowView { viewConfig in
//                        NavigationLink(destination: ChatDetailView(provider: GroupChannelViewProvider(channelURL: "CHANNEL_URL"))) {
//                            ChatListItemView(channel: viewConfig.channel)
//                        }
//                    }
//                })
//        }
//        .onAppear {
//                    print("ChatListView appeared. Channel list provider: \(provider)")
//                }
//    }
//}
//
//struct ChatListItemView: View {
//    var channel: GroupChannel
//    
//    @Environment(\.colorScheme) var colorScheme
//    
//    var body: some View {
//        HStack(spacing: 12) {
//            if let url = channel.coverURL {
//                AsyncImage(url: URL(string: url)) { image in
//                    image.resizable()
//                } placeholder: {
//                    Image(systemName: "person.circle.fill")
//                        .resizable()
//                        .foregroundColor(Color(uiColor: .init(red: 193/255, green: 215/255, blue: 46/255, alpha: 0.5)))
//                }
//                .frame(width: 50, height: 50)
//                .clipShape(Circle())
//                .padding(.leading, 12)
//            }
//            
//            VStack(alignment: .leading, spacing: 8) {
//                HStack {
//                    Text(channel.name)
//                        .font(.headline)
//                        .foregroundColor(.primary)
//                    
//                    Spacer()
//                    
//                    if let lastMessage = channel.lastMessage {
//                        Text(formatTimestamp(lastMessage.createdAt))
//                            .font(.caption)
//                            .foregroundColor(Color(uiColor: .secondaryLabel))
//                    }
//                }
//                
//                Text(channel.lastMessage?.message ?? "No messages yet")
//                    .font(.subheadline)
//                    .foregroundColor(Color(uiColor: .secondaryLabel))
//                    .lineLimit(1)
//            }
//            
//            if channel.unreadMessageCount > 0 {
//                Text("\(channel.unreadMessageCount)")
//                    .font(.caption)
//                    .foregroundColor(.white)
//                    .padding(8)
//                    .background(Color.red)
//                    .clipShape(Circle())
//            }
//        }
//        .padding()
//        .background(
//            RoundedRectangle(cornerRadius: 12)
//                .stroke(Color(uiColor: .init(red: 193/255, green: 215/255, blue: 46/255, alpha: 0.5)), lineWidth: 1)
//                .background(
//                    (colorScheme == .dark ? Color.black : Color(uiColor: .systemBackground))
//                        .clipShape(RoundedRectangle(cornerRadius: 12))
//                )
//        )
//        .padding(.horizontal)
//        .padding(.vertical, 4)
//    }
//    
//    private func formatTimestamp(_ timestamp: Int64) -> String {
//        let date = Date(timeIntervalSince1970: TimeInterval(timestamp) / 1000)
//        let formatter = DateFormatter()
//        formatter.dateFormat = "hh:mm a"
//        return formatter.string(from: date)
//    }
//}





//NavigationLink(destination: ChatDetailView(provider: GroupChannelViewProvider(channelURL: "CHANNEL_URL"))) {
//    ChatListItemView(channel: viewConfig.channel)
//}
