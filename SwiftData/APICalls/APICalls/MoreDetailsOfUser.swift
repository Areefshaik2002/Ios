//
//  MoreDetailsOfUser.swift
//  APICalls
//
//  Created by Shaik Areef on 26/02/25.
//

import Foundation
import SwiftUI

struct MoreDetailsOfUser: View {
    var viewModel : GHViewModel
    let user: GitHubUser
    
    var body: some View {
        VStack{
            Text(user.name ?? "")
            let createdDate = viewModel.fullDate(from: user.createdAt ?? "")
            Text(createdDate)
            let updatedDate = viewModel.fullDate(from: user.updatedAt ?? "")
            Text(updatedDate)
            Text("\(user.followers ?? 0)")
            Text("\(user.followers ?? 0)")
        }
    }
}
