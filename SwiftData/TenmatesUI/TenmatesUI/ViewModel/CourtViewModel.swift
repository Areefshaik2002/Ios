//
//  CourtViewModel.swift
//  TenmatesUI
//
//  Created by Shaik Areef on 18/02/25.
//

import Foundation

class CourtViewModel: ObservableObject {
    @Published var courts: [CourtCell] = []
    
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
