//
//  DisplayChannelView.swift
//  SendBird
//
//  Created by Shaik Areef on 19/03/25.
//

import UIKit
import SwiftUI
import SendbirdSwiftUI
import SendbirdChatSDK
import SendbirdUIKit

struct ChatDetailView: View {
    var channel: GroupChannel
    @StateObject var provider : GroupChannelViewProvider
    @Environment(\.dismiss) var dismiss
    
    init(channel: GroupChannel) {
            self.channel = channel
            _provider = StateObject(wrappedValue: GroupChannelViewProvider(channelURL: channel.channelURL))
        }

    var body: some View {
        GroupChannelView(
            provider: provider,
            headerItem: {
                .init()
                .leftView{ _ in
                    buttonToDismissChatDetailView
                }
                .coverImage{ _ in
                    if channel.members.count == 2, let url = channel.coverURL {
                        asyncImage(url: url, imagePlaceholderName: "person")
                    }else if channel.members.count == 3, let url = channel.coverURL {
                        asyncImage(url: url, imagePlaceholderName: "person.2")
                    }else if channel.members.count > 3, let url = channel.coverURL {
                        asyncImage(url: url, imagePlaceholderName: "music.microphone.circle")
                    }
                }
                .titleView{ _ in
                    viewTitle
                }
                .rightView{ _ in
                    channelSettingsView
                }
            },
            listItem: {
                .init()
                .adminMessageView{ viewConfig in
                    Text(viewConfig.message.message)
                        .background(.appPrimary.opacity(0.8))
                        .frame(width: 240, height: 80, alignment: .center)
                        .cornerRadius(12)
                        .font(.headline)
                        .foregroundColor(.primary)
                }
            },
            inputItem: {
                .init()
                .sendButton{ viewConfig in
                    Button(action:  {
            
                    }){
                        Image(systemName: "paperplane.fill")
                            .frame(width: 30, height: 30)
                            .foregroundColor(.appPrimary)
                    }
                }
            }
            
        )
    }
    
    var viewTitle: some View{
        Text(channel.name)
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(.primary)
    }
    
    var buttonToDismissChatDetailView: some View{
        Button(action: {
            dismiss()
        }){
            Image(systemName: "chevron.left")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.appPrimary)
        }
    }
    
    var channelSettingsView: some View{
        Button(action: {
            provider.showChannelSettings()
        }){
            Image(systemName: "gearshape")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.appPrimary)
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




/*
import SwiftUI
import SendbirdChatSDK
import SendbirdSwiftUI

struct ChatDetailView: View {
    let channelURL: String
    @StateObject private var provider: GroupChannelViewProvider
    @Environment(\.dismiss) var dismiss

    var channel: GroupChannel? { provider.channel }

    init(channelURL: String) {
        self.channelURL = channelURL
        _provider = StateObject(wrappedValue: GroupChannelViewProvider(channelURL: channelURL))
    }

    var body: some View {
        GroupChannelView(
            provider: provider,
            headerItem: {
                .init()
                .leftView { _ in
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .frame(width: 25, height: 25)
                            .foregroundColor(.green)
                    }
                }
                .titleView { _ in
                    HStack {
                        if let url = channel?.coverURL {
                            AsyncImage(url: URL(string: url)) { image in
                                image.resizable()
                            } placeholder: {
                                Image(systemName: "person.circle.fill").resizable()
                            }
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                        }
                        
                        VStack(alignment: .leading) {
                            Text(channel?.name ?? "Unknown")
                                .font(.headline)
                        }
                    }
                }
                .rightView { _ in
                    Button(action: {
                        provider.showChannelSettings()
                    }) {
                        Image(systemName: "ellipsis")
                            .font(.title2)
                            .foregroundColor(.green)
                    }
                }
            }
        )
    }
}*/

