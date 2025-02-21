
//
//  PlayerInfoView.swift
//  TenmatesUI
//
//  Created by Shaik Areef on 19/02/25.
//

import SwiftUI
import Combine

struct PlayerInfoView: View {
    
    @StateObject private var viewModel = PlayerViewModel()
    @StateObject var recentMatchesViewModel = RecentMatchesViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical){
//                Player Details
                playerDetils()
                    .padding(.bottom, 30)
//                Recent matches
                Text("Recent matches")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .frame(width: 370, height: 30, alignment: .leading)
                ScrollView(.horizontal){
                    LazyHStack{
                        ForEach(recentMatchesViewModel.matches, id: \.id){ match in
                            if match.matchType == "singles"{
                                Singles(match: match)
                            }else{
                                Doubles(match: match)
                            }
                        }
                    }
                }
                .padding(.bottom, 20)
//                Events in commo0n
                    Text("Events in common")
                    .font(.system(size: 18))
                        .fontWeight(.bold)
                        .frame(width: 370, height: 30, alignment: .leading)
                ScrollView(.horizontal){
                    LazyHStack{
                        ForEach(1..<5 , id: \.self){ game in
                            EventsInCommon()
                        }
                    }
                    .padding(.leading, 10)
                }
                .padding(.bottom, 20)
//              Common teams
                CommonTeams()
                    .padding(.bottom, 20)
//                 Recent courts
                Text("Recent Courts")
                .font(.system(size: 18))
                    .fontWeight(.bold)
                    .frame(width: 370, height: 30, alignment: .leading)
                ScrollView(.horizontal){
                    LazyHStack{
                        ForEach(1..<5 , id: \.self){ game in
                            RecentCourts()
                        }
                    }
                    .padding(.leading, 20)
                }
            }
            .navigationTitle("Personal Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        print("Back button tapped")
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.init(red: 0.85, green: 1, blue: 0))
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        print("Help button tapped")
                    }) {
                        Image(systemName: "questionmark.message")
                            .foregroundColor(.init(red: 0.85, green: 1, blue: 0))
                    }
                }
            }
            
        }
    }
}
#Preview {
    PlayerInfoView()
}
