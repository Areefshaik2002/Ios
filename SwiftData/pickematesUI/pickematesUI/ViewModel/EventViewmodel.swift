
//  CourtViewModel.swift
//  TenmatesUI
//
//  Created by Shaik Areef on 18/02/25.
//

import Foundation
import Combine
import SwiftUI

let appColor = Color.init(red: 0.85, green: 1, blue: 0)
let appColorGradient = LinearGradient(colors: [Color(appColor).opacity(0.5), .black, Color(appColor).opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)

class EventViewModel: ObservableObject {
    @State var showBallAnimation: Bool = false
    @Published var courts: [CourtCell] = []
    @Published var isWithInTeam:Bool = false
    @Published var isCoachAvailable:Bool = true
    @Published var isAudienceAvailable:Bool = true
    
    init(){
        loadCourts()
    }
    
    func loadCourts() {
        courts = [
            CourtCell(courtNumber: 1, singleOrDouble: "Single", weekDay: "wednesday", month: "June", date: 02, time: "8AM", duration: "2h", location: "web bridge pickel ball courts", numberOfPlayers: 2, district: "Sports District", city: "Orlando", pincode: "FL 32801"),
            CourtCell(courtNumber: 2, singleOrDouble: "Single", weekDay: "wednesday", month: "June", date: 02, time: "10AM", duration: "2h", location: "web bridge pickel ball courts", numberOfPlayers: 2, district: "Sports District", city: "Orlando", pincode: "FL 32801"),
            CourtCell(courtNumber: 3, singleOrDouble: "Single", weekDay: "wednesday", month: "June", date: 02, time: "9AM", duration: "2h", location: "web bridge pickel ball courts", numberOfPlayers: 2, district: "Sports District", city: "Orlando", pincode: "FL 32801"),
            CourtCell(courtNumber: 4, singleOrDouble: "Single", weekDay: "wednesday", month: "June", date: 02, time: "7AM", duration: "2h", location: "web bridge pickel ball courts", numberOfPlayers: 2, district: "Sports District", city: "Orlando", pincode: "FL 32801"),
            CourtCell(courtNumber: 5, singleOrDouble: "Single", weekDay: "wednesday", month: "June", date: 02, time: "10AM", duration: "2h", location: "web bridge pickel ball courts", numberOfPlayers: 2, district: "Sports District", city: "Orlando", pincode: "FL 32801")
        ]

    }
}
