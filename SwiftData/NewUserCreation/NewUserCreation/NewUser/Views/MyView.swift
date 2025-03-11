//
//  MyView.swift
//  NewUserCreation
//
//  Created by Shaik Areef on 03/03/25.
//

import SwiftUI

struct CreateUserView: View {
     var viewModel : NewUserCreationViewModel
    
    @State private var mobileNumber = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var regionCode = "IN"
    @State private var countryId = 91
    @State private var role = "ur_player"  // Default role
    @State private var statusMessage = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Create User")
                .font(.largeTitle)
                .bold()
            
            TextField("Mobile Number", text: $mobileNumber)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("First Name", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Last Name", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Role", text: $role)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                Task {
//                    await createUser()
                }
            }) {
                Text("Create User")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(appColor))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            Text(statusMessage)
                .foregroundColor(.gray)
                .padding()
        }
        .padding()
    }
    
//    private func createUser() async {
//        statusMessage = "Fetching verification code..."
//        do {
//            await viewModel.addUserDetails(
//                mobileNumber: mobileNumber,
//                firstName: firstName,
//                lastName: lastName,
//                roles: [role],
//                countryId: countryId,
//                regionCode: regionCode
//            )
//            statusMessage = "User created successfully!"
//            //        } catch {
//            //            statusMessage = "Error: \(error.localizedDescription)"
//            //        }
//        }
//    }
}
