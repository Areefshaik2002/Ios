//
//  ContentView.swift
//  NewUserCreation
//
//  Created by Shaik Areef on 24/02/25.
//
import SwiftUI

var appColor = Color.init(red: 193/255, green: 215/255, blue: 46/255)
var appColorUIColor = UIColor.init(red: 193/255, green: 215/255, blue: 46/255,alpha: 1.0)

struct NewUserCreationPlayerView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var playerMobileNumber: String = ""
    @State var parentFirstName: String = ""
    @State var parentLastName: String = ""
    @State var parentMobileNumber: String = ""
    @State var togglePlayerVariable: Bool = false
    @State var toggleParentVariable: Bool = false
    @State var toggle: Int = 0
    
    var body: some View {
        NavigationStack {
            mainContentView
                .navigationTitle("New Player")
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
        }
    }
    
    var mainContentView: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading, spacing: 8) {
                    Text("PlayerType")
                        .font(.system(size: 14, weight: .medium))
                        .padding(.top, 16)
                    HStack(spacing: 0) {
                        
                        Picker("", selection: $toggle) {
                            Text("Self-managed")
                                .tag(0)
                            Text("Parent-managed")
                                .tag(1)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .onAppear(perform: {
                            UISegmentedControl.appearance().selectedSegmentTintColor = appColorUIColor
                            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black as Any], for: .selected)
                        })
                    }
                    if toggle == 0 {
                        selfManagedView
                    } else {
                        parentManagedView
                    }
                }
                .frame(width: 358, alignment: .leading)
            }
            Spacer()
            saveButton
        }
        .padding(.horizontal,16)
    }
    
    var selfManagedView: some View {
        VStack(alignment: .leading, spacing: 16) {
            importFromContactsView
            name(placeholder: "First Name", text: $firstName)
            if firstName.isEmpty{
                Text("Player First name cannot be empty!!")
                    .foregroundColor(.red)
                    .font(.system(size: 12))
            }
            name(placeholder: "Last Name", text: $lastName)
            if lastName.isEmpty{
                Text("Player Last name cannot be empty!!")
                    .foregroundColor(.red)
                    .font(.system(size: 12))
            }
            countryAndMobilePlayerView
            if !playerMobileNumber.isEmpty{
                invitePlayersView
            }
        }
    }
    
    var parentManagedView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Player Info")
                .font(.system(size: 14, weight: .medium))
            importFromContactsView
            name(placeholder: "First Name", text: $firstName)
            if firstName.isEmpty{
                Text("Player First name cannot be empty!!")
                    .foregroundColor(.red)
                    .font(.system(size: 12))
            }
            name(placeholder: "Last Name", text: $lastName)
            if lastName.isEmpty{
                Text("Player First name cannot be empty!!")
                    .foregroundColor(.red)
                    .font(.system(size: 12))
            }
            countryAndMobilePlayerView
            if !playerMobileNumber.isEmpty{
                invitePlayersView
            }
            Text("Parent Info")
                .font(.system(size: 14, weight: .medium))
            importFromContactsView
            name(placeholder: "Parent First Name", text: $parentFirstName)
            if parentFirstName.isEmpty{
                Text("Parent First name cannot be empty!!")
                    .foregroundColor(.red)
                    .font(.system(size: 12))
            }
            name(placeholder: "Parent Last Name", text: $parentLastName)
            if parentLastName.isEmpty{
                Text("Parent Last name cannot be empty!!")
                    .foregroundColor(.red)
                    .font(.system(size: 12))
            }
            countryAndMobileParentView
            if !parentMobileNumber.isEmpty{
                inviteParentsView
            }
        }
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
                .stroke(Color(appColor.opacity(0.2)), lineWidth: 2.49)
        )
        .padding(.top, 8)
    }
    
    var countryAndMobilePlayerView: some View {
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
            TextField("999999999", text: $playerMobileNumber)
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
    
    var countryAndMobileParentView: some View {
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
            TextField("999999999", text: $parentMobileNumber)
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
    
    var invitePlayersView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Invite this player to the app")
                    .font(.system(size: 14, weight: .medium))
                    .frame(width: 182, height: 17)
                    .lineLimit(1)
                Text("If this option is enabled we will send a notification to the player's mobile number to download the app and register.")
                    .foregroundColor(.secondary)
                    .frame(width: 260, height: 54)
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
            }
            Toggle("", isOn: $togglePlayerVariable)
                .tint(Color(appColor))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
        .cornerRadius(8)
    }
    
    var inviteParentsView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Invite this parent to the app")
                    .font(.system(size: 14, weight: .medium))
                    .frame(width: 299, height: 17)
                    .lineLimit(1)
                Text("If this option is enabled we will send a notification to the parent's mobile number to download the app and register.")
                    .foregroundColor(.secondary)
                    .frame(width: 260, height: 54)
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
            }
            Toggle("", isOn: $toggleParentVariable)
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
        }
    }
    
    var closeButton: some View {
        Button(action: {
            print("Close button tapped")
        }) {
            Image(systemName: "multiply")
                .foregroundColor(Color(appColor))
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
