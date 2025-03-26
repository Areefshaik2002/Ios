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
    @Environment(\.colorScheme) var colorScheme
    
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
                        .background(Color(.systemBackground))
                        .padding(.bottom, 12)
                }
                .titleView { _ in
                    EmptyView()
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
                                    .foregroundColor(Color(uiColor: .init(red: 193/255, green: 215/255, blue: 46/255,alpha: 0.5)))
                            }
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding(.leading, 12)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text(viewConfig.channel.name)
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
                        
                        if viewConfig.channel.unreadMessageCount > 0 {
                            Text("\(viewConfig.channel.unreadMessageCount)")
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.red)
                                .clipShape(Circle())
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(uiColor: .init(red: 193/255, green: 215/255, blue: 46/255, alpha: 0.5)), lineWidth: 1)
                            .background(
                                (colorScheme == .dark ? Color.black : Color(uiColor: .secondarySystemBackground))
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                            )
                    )
                    .padding(.horizontal)
                    .padding(.vertical,4)
                }
            })
        .onAppear {
            handleSendbirdUiMode()
        }
    }
    
    private func formatTimestamp(_ timestamp: Int64) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp) / 1000)
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: date)
    }
    
    

    private func handleSendbirdUiMode() {
        var uiMode = UITraitCollection.current.userInterfaceStyle
        
        if uiMode == .dark{
            SBUTheme.set(colorScheme: SBUTheme.dark)
        }else{
            SBUTheme.set(colorScheme: SBUTheme.light)
        }
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
