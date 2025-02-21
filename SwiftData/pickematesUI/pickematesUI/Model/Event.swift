

//
//  Event.swift
//  TenmatesUI
//
//  Created by Shaik Areef on 18/02/25.
//

import Foundation

struct CourtCell: Identifiable  {
    let id = UUID()
    let courtNumber : Int
    let singleOrDouble : String
    let weekDay : String
    let month : String
    let date : Int
    let time : String
    let duration : String
    let location : String
    let numberOfPlayers : Int
    let district : String
    let city : String
    let pincode : String
}
