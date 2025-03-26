//
//  DisplayChannelView.swift
//  SendBird
//
//  Created by Shaik Areef on 19/03/25.
//

//import SwiftUI
//import SendbirdSwiftUI
//import SendbirdChatSDK
//
//struct ChatDetailView: View {
//    let channelURL: String
//    @StateObject var provider: GroupChannelViewProvider
//    @Environment(\.dismiss) var dismiss
//    
//    init(channelURL: String) {
//        self.channelURL = channelURL
//        self._provider = StateObject(wrappedValue: GroupChannelViewProvider(channelURL: channelURL))
//    }
//    
//    var body: some View {
//        GroupChannelView(
//            provider: provider,
//            headerItem: {
//                var item = GroupChannelView.HeaderItem()
//                item.leftView { _ in
//                    Button(action: {
//                        dismiss()
//                    }) {
//                        Image(systemName: "chevron.left")
//                            .font(.title2)
//                            .foregroundColor(.red)
//                    }
//                }
//                item.titleView { config in
//                    HStack {
//                        if let url = config.channel.coverURL {
//                            AsyncImage(url: URL(string: url)) { image in
//                                image.resizable()
//                            } placeholder: {
//                                Image(systemName: "person.circle.fill").resizable()
//                            }
//                            .frame(width: 32, height: 32)
//                            .clipShape(Circle())
//                        }
//                        
//                        VStack(alignment: .leading) {
//                            Text(config.channel.name)
//                                .font(.headline)
//                            TypingIndicatorView(channel: config.channel)
//                        }
//                    }
//                }
//                item.rightView { _ in
//                    Button(action: {
//                        provider.showChannelSettings()
//                    }) {
//                        Image(systemName: "ellipsis")
//                            .font(.title2)
//                            .foregroundColor(.blue)
//                    }
//                }
//                return item
//            }(),
//            listItem: {
//                var item = GroupChannelView.ListItem()
//                item.rowView { viewConfig in
//                    CustomMessageBubbleView(viewConfig: viewConfig)
//                }
//                return item
//            }()
//        )
//
//    }
//}
//
//
//struct TypingIndicatorView: View {
//    let channel: GroupChannel
//    @State private var typingUsers: [User] = []
//
//    var body: some View {
//        Text(typingUsers.isEmpty ? "" : "Typing...")
//            .font(.caption)
//            .foregroundColor(.gray)
//            .onAppear {
//                channel.addTypingStatusObserver(self) { updatedChannel in
//                    typingUsers = updatedChannel.typingUsers
//                }
//            }
//            .onDisappear {
//                channel.removeTypingStatusObserver(self)
//            }
//    }
//}
//
//struct CustomMessageBubbleView: View {
//    let viewConfig: MessageViewConfig
//    
//    var body: some View {
//        HStack {
//            if viewConfig.message.sender?.userId == SendbirdChat.getCurrentUser()?.userId {
//                Spacer()
//                Text(viewConfig.message.message ?? "")
//                    .padding()
//                    .background(Color.green.opacity(0.8))
//                    .foregroundColor(.white)
//                    .cornerRadius(12)
//                    .frame(maxWidth: 250, alignment: .trailing)
//            } else {
//                if let profileURL = viewConfig.message.sender?.profileURL {
//                    AsyncImage(url: URL(string: profileURL)) { image in
//                        image.resizable()
//                    } placeholder: {
//                        Image(systemName: "person.circle.fill")
//                            .resizable()
//                            .foregroundColor(.gray)
//                    }
//                    .frame(width: 40, height: 40)
//                    .clipShape(Circle())
//                }
//                
//                Text(viewConfig.message.message ?? "")
//                    .padding()
//                    .background(Color.gray.opacity(0.2))
//                    .foregroundColor(.black)
//                    .cornerRadius(12)
//                    .frame(maxWidth: 250, alignment: .leading)
//                
//                Spacer()
//            }
//        }
//        .padding(.horizontal)
//    }
//}

