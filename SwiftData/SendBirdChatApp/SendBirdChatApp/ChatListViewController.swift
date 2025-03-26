//
//  ViewController.swift
//  SendBirdChatApp
//
//  Created by Shaik Areef on 21/03/25.
//

import UIKit
import SendbirdChatSDK

class ChatListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let tableView = UITableView()
    private var channels: [GroupChannel] = []
    private let userId = "Areefshaik2002"
    private let accessToken = "3d10c5e4f10e3a281bf23168c98fcba90918f98c"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        authenticateUser()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    private func authenticateUser() {
        SendbirdChat.connect(userId: userId, authToken: accessToken, completionHandler: { user, error in
            if let error = error {
                print("User connection failed: \(error.localizedDescription)")
                self.createUserIfNeeded()
                return
            }
            print("Connected as \(user?.userId ?? "Unknown")")
            self.fetchChannels()
        })
    }



    private func createUserIfNeeded() {
        let params = UserCreateParams()
        params.userId = userId
        params.nickname = "Areef"
        params.accessToken = accessToken

        SendbirdChat.createUser(params: params) { user, error in
            if let error = error {
                print("User creation failed: \(error.localizedDescription)")
                return
            }
            print("User created successfully: \(user?.userId ?? "Unknown")")
            self.authenticateUser()
        }
    }

    private func fetchChannels() {
        guard SendbirdChat.getCurrentUser() != nil else {
            print("User not connected. Retrying authentication...")
            authenticateUser()
            return
        }

        let params = GroupChannelListQueryParams()
        let query = GroupChannel.createMyGroupChannelListQuery(params: params)

        query.loadNextPage { channels, error in
            if let error = error {
                print("Error fetching channels: \(error.localizedDescription)")
                return
            }
            self.channels = channels ?? []
            print("Fetched \(self.channels.count) channels")

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - UITableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = channels[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatVC = ChatViewController(channel: channels[indexPath.row])
        navigationController?.pushViewController(chatVC, animated: true)
    }
}
