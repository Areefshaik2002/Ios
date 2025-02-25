//
//  NewUserCreationCoachView.swift
//  NewUserCreation
//
//  Created by Shaik Areef on 25/02/25.
//

import SwiftUI

struct NewUserCreationCoachView: View {
    
    @State var coachFirstName: String = ""
    @State var coachLastName: String = ""
    @State var coachMobileNumber: String = ""
    @State var toggleCoachVariable: Bool = false
    
    var body: some View {
        NavigationStack {
            mainContentView
                .navigationTitle("New Coach")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(false)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        questionMarkMessageButton
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        closeButton.padding(.trailing, 8)
                    }
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
        }
    }
    
    var mainContentView: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading, spacing: 16) {
                    importFromContactsView
                    name(placeholder: "First Name", text: $coachFirstName)
                    if coachFirstName.isEmpty{
                        Text("Coach First name cannot be empty!!")
                            .foregroundColor(.red)
                            .font(.system(size: 12))
                    }
                    name(placeholder: "Last Name", text: $coachLastName)
                    if coachLastName.isEmpty{
                        Text("Coach Last name cannot be empty!!")
                            .foregroundColor(.red)
                            .font(.system(size: 12))
                    }
                    countryAndMobileCoachView
                    if !coachMobileNumber.isEmpty{
                        inviteCoachView
                    }
                }
                .frame(width: 358, alignment: .leading)
            }
            saveButton
        }
        .padding(.horizontal,16)
    }
    
    var importFromContactsView: some View {
        HStack(spacing: 12) {
            Image(systemName: "person.circle")
                .foregroundColor(Color(appColor))
            Text("Import from contacts")
                .font(.system(size: 16, weight: .medium))
        }
        .padding(.leading, 13.28)
        .frame(width: 358,height: 50, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(appColor.opacity(0.3)), lineWidth: 1)
        )
    }
    
    var countryAndMobileCoachView: some View {
        HStack(spacing: 8) {
            HStack {
                Image("India")
                    .resizable()
                    .frame(width: 40, height: 26.34)
                    .cornerRadius(3.9)
                Text("+91")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.secondary)
            }
            Divider()
                .frame(height: 32)
                .border(.gray, width: 1)
            TextField("999999999", text: $coachMobileNumber)
                .keyboardType(.numberPad)
                .foregroundColor(.white)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
        .cornerRadius(8)
    }
    
    var inviteCoachView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Invite this coach to the app")
                    .font(.system(size: 14, weight: .medium))
                    .frame(width: 182, height: 17)
                    .lineLimit(1)
                Text("If this option is enabled we will send a notification to the coach's mobile number to download the app and register.")
                    .foregroundColor(.secondary)
                    .frame(width: 260, height: 54)
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
            }
            Toggle("", isOn: $toggleCoachVariable)
                .tint(Color(appColor))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
        .cornerRadius(8)
    }
    
    var saveButton: some View {
        Button(action: {
            print("Save button tapped")
        }) {
            Text("Save")
                .frame(width: 358, height: 48)
                .font(.headline)
                .foregroundColor(.black)
                .background(Color(appColor))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white, lineWidth: 1)
                )
                .cornerRadius(8)
        }
    }
    
    var questionMarkMessageButton: some View {
        Button(action: {
            print("Help button tapped")
        }) {
            Image(systemName: "questionmark.circle")
                .foregroundColor(Color(appColor))
                .frame(width: 32, height: 32)
        }
    }
    
    var closeButton: some View {
        Button(action: {
            print("Close button tapped")
        }) {
            Image(systemName: "multiply")
                .foregroundColor(Color(appColor))
                .frame(width: 32, height: 32)
        }
    }
    
    func name(placeholder: String, text: Binding<String>) -> some View {
        TextField(placeholder, text: text)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .frame(height: 48)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .cornerRadius(8)
    }
    
//    func toggleButton(title: String, isSelected: Bool, action: @escaping() -> Void) -> some View {
//        Button(action: action) {
//            Text(title)
//                .padding()
//                .frame(width: 179, height: 40)
//                .background(
//                    RoundedRectangle(cornerRadius: 4)
//                        .stroke(Color.gray, lineWidth: 1)
//                        .background(isSelected ? Color(appColor) : Color.black)
//                )
//                .foregroundColor(isSelected ? .black : .white)
//                .animation(.easeInOut, value: isSelected)
//        }
//    }
}
