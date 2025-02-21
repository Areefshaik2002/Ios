//
//  CourtViewModel.swift
//  TenmatesUI
//
//  Created by Shaik Areef on 18/02/25.
//

import Foundation
import Combine
import SwiftUI
import Observation

let appColor = Color.init(red: 0.85, green: 1, blue: 0)
let appColorGradient = LinearGradient(colors: [Color(appColor).opacity(0.5), .black, Color(appColor).opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)

@Observable
class EventViewModel{
    var event: Welcome?
    var eventCourt: EventCourt?
    var places : Place?
    var address: AddressDetail?
    var errorMessage: String?
    var events: EventCourt?
    var eventCoach: EventCoach?
    var users: User?
    
    func fetchEvent(eventID: String) async {
        do {
            let fetchedEvent = try await fetchEventDetails(eventID: eventID )
            event = fetchedEvent
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}


