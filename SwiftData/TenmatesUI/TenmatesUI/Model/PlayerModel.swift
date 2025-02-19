//
//  PlayerModel.swift
//  TenmatesUI
//
//  Created by Shaik Areef on 19/02/25.
//

import Foundation

struct PlayerModel: Identifiable{
    let id = UUID()
    let playerImage : String
    let PlayerName : String
    let playerPhoneNumber : String
    let playerEmail : String
    let playerClubs : [String]
    let parentName : String
    let parentPhoneNumber : String
    let parentEmail : String
}

struct RecentMatchesModel:Identifiable  {
    let id = UUID()
    let matchName: String
    let matchDate: String
    let matchTime: String
    let matchType:String
}
