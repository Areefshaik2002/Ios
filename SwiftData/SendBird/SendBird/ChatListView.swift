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
    
    var body: some View {
        GroupChannelListView(
            provider: provider,
            headerItem: {
                .init()
                .leftView { _ in
                    //                    Text("Chats")
                    //                        .font(.largeTitle)
                    //                        .fontWeight(.bold)
                    //                        .foregroundColor(.primary)
                }
                .titleView { _ in
                    //                    EmptyView()
                    Text("Chats")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                .rightView { _ in
                    Button(action: {
                        provider.showCreateChannel()
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.appPrimary)
                    }
                }
            },
            listItem: {
                .init()
                .rowView { viewConfig in
                    HStack(spacing: 12) {
                        if viewConfig.channel.members.count == 2, let url = viewConfig.channel.coverURL {
                            ZStack {
                                Circle()
                                    .fill(.appPrimary.opacity(0.2))
                                    .frame(width: 50, height: 50)

                                AsyncImage(url: URL(string: url)) { image in
                                    image.resizable()
                                        .scaledToFill()
                                        .frame(width: 30, height: 30)
                                        .clipShape(Circle())
                                } placeholder: {
                                    Image(systemName: "person")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 30, height: 30)
                                        .clipShape(Circle())
                                        .foregroundColor(.appPrimary)
                                }
                            }
                            .frame(width: 50, height: 50)
                        }else if viewConfig.channel.members.count == 3, let url = viewConfig.channel.coverURL {
                            ZStack {
                                Circle()
                                    .fill(.appPrimary.opacity(0.2))
                                    .frame(width: 50, height: 50)

                                AsyncImage(url: URL(string: url)) { image in
                                    image.resizable()
                                        .scaledToFill()
                                        .frame(width: 30, height: 30)
                                        .clipShape(Circle())
                                } placeholder: {
                                    Image(systemName: "person.2")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 30, height: 30)
                                        .clipShape(Circle())
                                        .foregroundColor(.appPrimary)
                                }
                            }
                            .frame(width: 50, height: 50)
                        }else if viewConfig.channel.members.count > 3, let url = viewConfig.channel.coverURL {
                            ZStack {
                                Circle()
                                    .fill(.appPrimary.opacity(0.2))
                                    .frame(width: 50, height: 50)

                                AsyncImage(url: URL(string: url)) { image in
                                    image.resizable()
                                        .scaledToFill()
                                        .frame(width: 30, height: 30)
                                        .clipShape(Circle())
                                } placeholder: {
                                    Image(systemName: "music.microphone.circle")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 30, height: 30)
                                        .clipShape(Circle())
                                        .foregroundColor(.appPrimary)
                                }
                            }
                            .frame(width: 50, height: 50)
                        }
                        VStack(alignment: .leading, spacing: 0) {
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
                            HStack{
                                if viewConfig.channel.isTyping(){
                                    Text("Typing...")
                                        .font(.subheadline)
                                        .foregroundColor(.blue)
                                }else {
                                    Text(viewConfig.channel.lastMessage?.message ?? "No messages yet")
                                        .font(.subheadline)
                                        .foregroundColor(Color(uiColor: .secondaryLabel))
                                        .lineLimit(1)
                                }
                                Spacer()
                                if viewConfig.channel.unreadMessageCount > 0 {
                                    Text("\(viewConfig.channel.unreadMessageCount)")
                                        .frame(width: 8, height: 8)
                                        .font(.system(size: 8))
                                        .foregroundColor(.black)
                                        .padding(6)
                                        .background(.appPrimary)
                                        .clipShape(Circle())
                                }
                            }
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.appPrimary.opacity(0.5), lineWidth: 1)
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

