//
//  DisplayChannelView.swift
//  SendBird
//
//  Created by Shaik Areef on 19/03/25.
//

//import UIKit
//import SendBirdUIKit
//import SendbirdChatSDK
//
//// Message List View Controller (UIKit)
//class MessageList: SBUGroupChannelViewController {
//    
//    // Required initializer from SBUGroupChannelViewController
//    required init(channel: SBDGroupChannel, messageListParams: SBUMessageListParams) {
//        super.init(channel: channel, messageListParams: messageListParams)
//    }
//    
//    init(channelUrl: String) {
//        // Create a dummy SBDGroupChannel object (replace with actual logic to fetch a channel)
//        let dummyChannel = SBDGroupChannel(channelUrl: channelUrl) // Replace this with actual fetching logic
//        
//        // Create message list parameters (can be customized based on your needs)
//        let messageListParams = SBUMessageListParams()
//        
//        super.init(channel: dummyChannel, messageListParams: messageListParams) // Call the required initializer
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//// Channel List View Controller (UIKit)
//class ChannelListVC: SBUGroupChannelListViewController {
//    
//    // Override the UITableViewDelegate method to handle channel selection
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let channel = self.channelList[indexPath.row] // Getting the selected channel from the list
//        let channelVC = MessageList(channelUrl: channel.channelURL) // Create the MessageList view controller with the selected channel's URL
//        
//        let naviVC = UINavigationController(rootViewController: channelVC) // Wrap the view controller in a navigation controller
//        naviVC.modalPresentationStyle = .fullScreen // Set presentation style
//        self.present(naviVC, animated: true) // Present the channel view controller
//    }
//}
//
//// SwiftUI-based Chat Detail View using UIKit components
//struct ChatDetailView: View {
//    var body: some View {
//        VStack {
//            Text("Chat Detail View")
//                .font(.title)
//                .padding()
//            
//            UIKitChannelListView()  // Using the UIKit Channel List View inside SwiftUI
//        }
//    }
//}
//
//// SwiftUI view that wraps the UIKit-based ChannelListVC
//struct UIKitChannelListView: UIViewControllerRepresentable {
//    
//    func makeUIViewController(context: Context) -> ChannelListVC {
//        let channelListVC = ChannelListVC() // Instantiate the ChannelListVC
//        return channelListVC
//    }
//    
//    func updateUIViewController(_ uiViewController: ChannelListVC, context: Context) {
//        // You can update the UIViewController here if needed
//    }
//}
//
//// Main SwiftUI View that contains the UIKit-based Channel List
//struct ContentView: View {
//    var body: some View {
//        ChatDetailView()
//    }
//}
//
//#Preview {
//    ContentView()
//}
