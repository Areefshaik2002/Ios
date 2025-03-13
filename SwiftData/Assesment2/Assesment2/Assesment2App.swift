//
//  Assesment2App.swift
//  Assesment2
//
//  Created by Shaik Areef on 12/03/25.
//

import SwiftUI

@main
struct Assesment2App: App {
    var body: some Scene {
        WindowGroup {
            UsersView( viewModel: CommentViewModel())
        }
    }
}
