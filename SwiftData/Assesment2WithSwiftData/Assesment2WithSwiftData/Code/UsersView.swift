//
//  UsersView.swift
//  Assesment2WithSwiftData
//
//  Created by Shaik Areef on 17/03/25.
//
import SwiftUI
import SwiftData

struct UsersView: View {
    @State private var username = ""
    @State private var useremail = ""
    @State private var navigateToComments = false
    @Environment(\.modelContext) private var modelContext
    var viewModel: ViewModel

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Form {
                    TextField("Enter username", text: $username)
                        .frame(width: 200, height: 50, alignment: .center)
                    TextField("Enter email", text: $useremail)
                        .frame(width: 200, height: 50, alignment: .center)
                    submitButton
                }
            }
            .navigationTitle("Enter your credentials")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $navigateToComments) {
                CommentsView(viewModel: viewModel)
            }
            .task {
                await viewModel.getData()
            }
        }
    }
    
    var submitButton: some View {
        HStack {
            Button(action: checkUserCredentials) {
                Text("Submit")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 200, height: 40)
                    .background(.green)
                    .cornerRadius(12)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    func checkUserCredentials() {
        if viewModel.users.first(where: { $0.name == username && $0.email == useremail }) != nil {
            navigateToComments = true
        }
    }
}

