//
//  ContentView.swift
//  Sendbirdpractice
//
//  Created by Shaik Areef on 26/03/25.
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
                    Text("Chats")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                .titleView { _ in
                    EmptyView()
                    //                    Text("Chats")
                    //                        .font(.largeTitle)
                    //                        .fontWeight(.bold)
                    //                        .foregroundColor(.primary)
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
                                        .frame(width: 20, height: 20)
                                        .clipShape(Circle())
                                } placeholder: {
                                    Image(systemName: "person")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 20, height: 20)
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
                                        .frame(width: 25, height: 25)
                                        .clipShape(Circle())
                                } placeholder: {
                                    Image(systemName: "person.2")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 20, height: 20)
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
                                        .frame(width: 25, height: 25)
                                        .clipShape(Circle())
                                } placeholder: {
                                    Image(systemName: "music.microphone.circle")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 20, height: 20)
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
                            HStack(spacing: 0){
                                if let lastMessage = viewConfig.channel.lastMessage {
                                    let readStatus = viewConfig.channel.getReadStatus(includeAllMembers: true)

                                    if let currentUser = SendbirdChat.getCurrentUser() {
                                        let allMembersRead = viewConfig.channel.members
                                            .filter { $0.userId != currentUser.userId }
                                            .allSatisfy { member in
                                                if let memberStatus = readStatus[member.userId] {
                                                    if let lastSeenAt = memberStatus["last_seen_at"] as? Int64 ??
                                                                       memberStatus["ts"] as? Int64 {
                                                        return lastMessage.createdAt <= lastSeenAt
                                                    }
                                                }
                                                return false
                                            }

                                        Image(systemName: allMembersRead ? "checkmark.circle.fill" : "checkmark.circle.fill")
                                            .font(.caption)
                                            .foregroundColor(allMembersRead ? .appPrimary : .gray)
                                    }
                                }

                                if viewConfig.channel.isTyping(){
                                    Text("Typing...")
                                        .font(.subheadline)
                                        .foregroundColor(.appPrimary)
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
                            .stroke(.appPrimary.opacity(0.3), lineWidth: 1)
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



import UIKit
import SwiftUI
import SendbirdSwiftUI
import SendbirdChatSDK
import SendbirdUIKit

struct ChatListView: View {
    @StateObject var provider = GroupChannelListViewProvider()
    var body: some View {
        mainContent
    }
    
    var mainContent: some View {
        GroupChannelListView(
            provider: provider,
            headerItem: {
                .init()
                .leftView { _ in
                    viewTitle
                }
                .titleView { _ in
                    EmptyView()
                }
                .rightView { _ in
                    createChannelButton
                }
            },
            listItem: {
                .init()
                .rowView { viewConfig in
                        HStack(spacing: 12) {
                            ProfileImageView(channel: viewConfig.channel)
                            NavigationLink(destination: ChatDetailView(channel: viewConfig.channel)){
                                ChatMessageRowView(channel: viewConfig.channel)
                            }
                        }
                        .frame(width: 358)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.appPrimary.opacity(0.3), lineWidth: 1)
                                .background(
                                    Color(uiColor: .systemBackground)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                )
                        )
                        .padding(.vertical, 8)
                    }
            })
    }
    
    var viewTitle: some View{
        Text("Chat")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.primary)
    }
    
    var createChannelButton: some View{
        Button(action: {
            provider.showCreateChannel()
        }) {
            Image(systemName: "plus")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.appPrimary)
        }
    }
}

struct ProfileImageView: View{
    var channel: GroupChannel
    var body: some View{
        if channel.members.count == 2, let url = channel.coverURL {
                asyncImage(url: url, imagePlaceholderName: "person")
            }else if channel.members.count == 3, let url = channel.coverURL {
                asyncImage(url: url, imagePlaceholderName: "person.2")
            }else if channel.members.count > 3, let url = channel.coverURL {
                asyncImage(url: url, imagePlaceholderName: "music.microphone.circle")
            }
    }
    func asyncImage(url:String, imagePlaceholderName: String) -> some View {
        ZStack {
            Circle()
                .fill(.appPrimary.opacity(0.2))
                .frame(width: 50, height: 50)

            AsyncImage(url: URL(string: url)) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .clipShape(Circle())
            } placeholder: {
                Image(systemName: imagePlaceholderName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.appPrimary)
            }
        }
        .frame(width: 50, height: 50)
    }
}

struct ChatMessageRowView: View{
    var channel: GroupChannel
    var body: some View{
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                channelNameView
                
                Spacer()
                lastMessageTimeStampView
            }
            HStack(spacing: 0){
                if let lastMessage = channel.lastMessage {
                    let readStatus = channel.getReadStatus(includeAllMembers: true)
                    
                    if let currentUser = SendbirdChat.getCurrentUser() {
                        let allMembersRead = channel.members
                            .filter { $0.userId != currentUser.userId }
                            .allSatisfy { member in
                                if let memberStatus = readStatus[member.userId] {
                                    if let lastSeenAt = memberStatus["last_seen_at"] as? Int64 ??
                                        memberStatus["ts"] as? Int64 {
                                        return lastMessage.createdAt <= lastSeenAt
                                    }
                                }
                                return false
                            }
                        
                        Image(systemName: allMembersRead ? "checkmark.circle.fill" : "checkmark.circle.fill")
                            .font(.caption)
                            .foregroundColor(allMembersRead ? .appPrimary : .gray)
                    }
                }
                
                if channel.isTyping(){
                    isTypingView
                }else {
                    lastMessageView
                }
                Spacer()
                if channel.unreadMessageCount > 0 {
                    badgeView
                }
            }
        }
    }
    var channelNameView: some View {
        Text(channel.name.isEmpty ? "Unnamed Channel" : channel.name)
            .font(.headline)
            .foregroundColor(.primary)
    }
    
    var lastMessageTimeStampView: some View {
        Text(formatTimestamp(channel.lastMessage?.createdAt ?? Int64(Date().timeIntervalSince1970) * 1000))
            .font(.caption)
            .foregroundColor(Color(uiColor: .secondaryLabel))
    }
    
    var isTypingView: some View {
        Text("Typing...")
            .font(.subheadline)
            .foregroundColor(.appPrimary)
    }
    
    var lastMessageView: some View {
        Text(channel.lastMessage?.message ?? "No messages yet")
            .font(.subheadline)
            .foregroundColor(Color(uiColor: .secondaryLabel))
            .lineLimit(1)
    }
    
    var badgeView: some View {
        Text("\(channel.unreadMessageCount)")
            .frame(width: 8, height: 8)
            .font(.system(size: 8))
            .foregroundColor(.black)
            .padding(6)
            .background(.appPrimary)
            .clipShape(Circle())
    }
    private func formatTimestamp(_ timestamp: Int64) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp) / 1000)
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: date)
    }
}

