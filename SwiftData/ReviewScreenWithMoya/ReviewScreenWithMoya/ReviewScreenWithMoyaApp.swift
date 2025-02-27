//
//  ReviewScreenWithMoyaApp.swift
//  ReviewScreenWithMoya
//
//  Created by Shaik Areef on 26/02/25.
//

import SwiftUI

@main
struct ReviewScreenWithMoyaApp: App {
    var body: some Scene {
        WindowGroup {
            EventReviewView(viewModel: EventReviewViewModel())
        }
    }
}

