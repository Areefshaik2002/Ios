
//  PlayerViewModel.swift
//  TenmatesUI
//
//  Created by Shaik Areef on 19/02/25.
//

import Foundation
import SwiftUI
import Combine

class PlayerViewModel: ObservableObject {
    
    @Published  var players: [PlayerModel] = []
    
    init(){
        loadPlayers()
    }
    
    func loadPlayers(){
        players = [
            PlayerModel(playerImage: "pic3", PlayerName: "Cristina", playerPhoneNumber: "***(***)-4567", playerEmail: "zen****@gmail.com", playerClubs: ["Webb Bridge Pickleball courts", "Pickleball Mastercourt"], parentName: "John Doe", parentPhoneNumber: "***(***)-3317", parentEmail: "john_***@gmail.com"),
            PlayerModel(playerImage: "pic2", PlayerName: "Ronaldo", playerPhoneNumber: "***(***)-1234", playerEmail: "zen****@gmail.com", playerClubs: ["Webb Bridge Pickleball courts", "Pickleball Mastercourt"], parentName: "John Doe", parentPhoneNumber: "***(***)-3317", parentEmail: "john_***@gmail.com"),
            PlayerModel(playerImage: "pic1", PlayerName: "Messi", playerPhoneNumber: "***(***)-5678", playerEmail: "zen****@gmail.com", playerClubs: ["Webb Bridge Pickleball courts", "Pickleball Mastercourt"], parentName: "John Doe", parentPhoneNumber: "***(***)-3317", parentEmail: "john_***@gmail.com"),
            PlayerModel(playerImage: "pic2", PlayerName: "Garnacho", playerPhoneNumber: "***(***)-9101", playerEmail: "zen****@gmail.com", playerClubs: ["Webb Bridge Pickleball courts", "Pickleball Mastercourt"], parentName: "John Doe", parentPhoneNumber: "***(***)-3317", parentEmail: "john_***@gmail.com"),
            PlayerModel(playerImage: "pic1", PlayerName: "Chetri", playerPhoneNumber: "***(***)-1213", playerEmail: "zen****@gmail.com", playerClubs: ["Webb Bridge Pickleball courts", "Pickleball Mastercourt"], parentName: "John Doe", parentPhoneNumber: "***(***)-3317", parentEmail: "john_***@gmail.com")
        ]
    }
}

class RecentMatchesViewModel: ObservableObject {
    
    let match = RecentMatchesModel(matchName: "EventName", matchDate: "09/15/24", matchTime: "3:00 PM", matchType: "singles")
    @Published var matches: [RecentMatchesModel] = []
    
    init(){
        loadMatches()
    }
    
    func loadMatches(){
        matches = [RecentMatchesModel(matchName: "EventName", matchDate: "09/15/24", matchTime: "3:00 PM", matchType: "singles")
        , RecentMatchesModel(matchName: "EventName", matchDate: "09/15/24", matchTime: "3:00 PM", matchType: "doubles")
        , RecentMatchesModel(matchName: "EventName", matchDate: "09/15/24", matchTime: "3:00 PM", matchType: "singles")
        , RecentMatchesModel(matchName: "EventName", matchDate: "09/15/24", matchTime: "3:00 PM", matchType: "doubles")
        , RecentMatchesModel(matchName: "EventName", matchDate: "09/15/24", matchTime: "3:00 PM", matchType: "doubles")]
    }
}
