//
//  ChatViewController.swift
//  SendBirdChatApp
//
//  Created by Shaik Areef on 21/03/25.
//

import UIKit
import SendbirdChatSDK

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let tableView = UITableView()
    private let messageInputField = UITextField()
    private var messages: [BaseMessage] = []
    private let channel: GroupChannel

    init(channel: GroupChannel) {
        self.channel = channel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchMessages()
    }

    private func setupUI() {
        view.backgroundColor = .white
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "messageCell")

        // Message Input Field
        messageInputField.frame = CGRect(x: 10, y: view.bounds.height - 60, width: view.bounds.width - 80, height: 50)
        messageInputField.placeholder = "Type a message..."
        messageInputField.borderStyle = .roundedRect

        let sendButton = UIButton(type: .system)
        sendButton.frame = CGRect(x: view.bounds.width - 70, y: view.bounds.height - 60, width: 60, height: 50)
        sendButton.setTitle("Send", for: .normal)
        sendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)

        view.addSubview(tableView)
        view.addSubview(messageInputField)
        view.addSubview(sendButton)
    }

    private func fetchMessages() {
        let params = MessageListParams()
        channel.getMessagesByTimestamp(Int64(Date().timeIntervalSince1970 * 1000), params: params) { messages, error in
            if let error = error {
                print("Error fetching messages: \(error.localizedDescription)")
                return
            }
            self.messages = messages ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    @objc private func sendMessage() {
        guard let message = messageInputField.text, !message.isEmpty else { return }
        
        let params = UserMessageCreateParams(message: message)
        channel.sendUserMessage(params: params) { userMessage, error in
            if let error = error {
                print("Error sending message: \(error.localizedDescription)")
                return
            }
            if let userMessage = userMessage {
                self.messages.append(userMessage)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.messageInputField.text = ""
                }
            }
        }
    }

    // MARK: - UITableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
        if let userMessage = messages[indexPath.row] as? UserMessage {
            cell.textLabel?.text = userMessage.message
        }
        return cell
    }
}
