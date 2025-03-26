//
//  DisplayChannelView.swift
//  SendBird
//
//  Created by Shaik Areef on 19/03/25.
//

import SwiftUI
import SendbirdSwiftUI
import SendbirdChatSDK

struct ChatDetailView: View {
    let channelURL: String
    @StateObject var provider: GroupChannelViewProvider
    @Environment(\.dismiss) var dismiss
    
    var channel: GroupChannel? { provider.channel }

    init(channelURL: String) {
        self.channelURL = channelURL
        self._provider = StateObject(wrappedValue: GroupChannelViewProvider(channelURL: channelURL))
    }

    var body: some View {
        GroupChannelView(
            provider: provider,
            headerItem: {
                .init()
                .leftView { _ in
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left").font(.title2)
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
                            .foregroundColor(.appPrimary)
                    }
                }
            }
        )
    }
}


//provider: provider,
//headerItem: {
//    .init()
//    .leftView{ _ in
//        Button(action: {
//            dismiss()
//        }){
//            Image(systemName: "chevron.left")
//                .resizable()
//                .frame(width: 30, height: 30)
//                .foregroundColor(primaryColor)
//        }
//    }
//    .rightView{ _ in
//        Button(action: {
//            provider.showChannelSettings()
//        }){
//            Image(systemName: "ellipsis.circle")
//                .resizable()
//                .frame(width: 30, height: 30)
//                .foregroundColor(primaryColor)
//        }
//    }
//}
