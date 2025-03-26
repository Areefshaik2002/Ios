//
//  SendBirdManager.swift
//  SendBirdChatApp
//
//  Created by Shaik Areef on 21/03/25.
//

import SendbirdChatSDK

class SendbirdManager {
    static let shared = SendbirdManager()
    
    func connectUser(userId: String, completion: @escaping (Bool) -> Void) {
        SendbirdChat.connect(userId: userId) { user, error in
            if let error = error {
                print("Error connecting to Sendbird: \(error.localizedDescription)")
                completion(false)
                return
            }
            print("Connected as: \(user?.userId ?? "Unknown")")
            completion(true)
        }
    }
}
