//
//  ChatDetailsView.swift
//  SendBirdTask
//
//  Created by Shaik Areef on 24/03/25.
//

import SwiftUI
import SendbirdSwiftUI

struct ChatDetailsView: View {
    @StateObject var provider : GroupChannelViewProvider
    var body: some View {
        GroupChannelView(provider: provider)
    }
}
