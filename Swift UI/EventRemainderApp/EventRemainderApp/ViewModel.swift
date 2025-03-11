//
//  ViewModel.swift
//  EventRemainderApp
//
//  Created by Shaik Areef on 10/03/25.
//

import Foundation

@Observable class EventViewModel {
    var events: [EventModel] = [] {
        didSet {
            saveEvents()
        }
    }
    
    private let eventsKey = "saved_events"

    init() {
        loadEvents()
    }

    func addEvent(_ event: EventModel) {
        events.append(event)
    }

    func deleteEvent(at offsets: IndexSet) {
        events.remove(atOffsets: offsets)
    }

    private func saveEvents() {
        if let encoded = try? JSONEncoder().encode(events) {
            UserDefaults.standard.set(encoded, forKey: eventsKey)
        }
    }

    private func loadEvents() {
        if let savedData = UserDefaults.standard.data(forKey: eventsKey),
           let decodedEvents = try? JSONDecoder().decode([EventModel].self, from: savedData) {
            events = decodedEvents
        }
    }
}
