//
//  ContentView.swift
//  StatemanagementTutorial
//
//  Created by Shaik Areef on 12/02/25.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var feedModel: FeedModel
    @State private var profileImage = Image(systemName: "person.circle")
    @State private var isEditingProfileImage: Bool = false
    var body: some View {
        NavigationView{
            VStack{
                profileImage
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    .shadow(radius: 5)
                    .onTapGesture {
                        isEditingProfileImage = true
                    }
                    .padding()
                Text("Areef Shaik")
                    .font(.headline)
                List(feedModel.posts){ post in
                    PostRow(post: post)
                }
            }
            .sheet(isPresented: $isEditingProfileImage){
                EditProfilePicView(profileImage : $profileImage)
            }
            .navigationTitle("Profile")
        }
    }
}

struct EditProfilePicView: View {
    @Binding var profileImage: Image
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Choose New Profile Picture")
                .font(.headline)
            
            HStack {
                Button(action: {
                    profileImage = Image(systemName: "person.crop.circle.fill")
                    dismiss()
                }) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                }
                
                Button(action: {
                    profileImage = Image(systemName: "person.crop.circle.badge.plus")
                    dismiss()
                }) {
                    Image(systemName: "person.crop.circle.badge.plus")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                }
            }
            .padding()
            
            Button("Cancel") {
                dismiss()
            }
            .foregroundColor(.red)
            .padding()
        }
    }
}

struct PostRow: View {
    @EnvironmentObject var feedModel: FeedModel
    var post: Post
    @State private var isAnimating = false
    
    var body: some View {
        HStack {
            Text(post.content)
                .font(.headline)
            
            Spacer()
            
            Button(action: {
                feedModel.toggleLike(for: post)
                withAnimation(.easeInOut(duration: 0.3)) {
                    isAnimating = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isAnimating = false
                }
            }) {
                Image(systemName: post.isLiked ? "heart.fill" : "heart")
                    .foregroundColor(post.isLiked ? .red : .gray)
                    .scaleEffect(isAnimating ? 1.5 : 1.0)
            }
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
