//
//  EventViewModel.swift
//  practiceApp
//
//  Created by Shaik Areef on 11/03/25.
//

import Foundation

@Observable class EventViewModel{
    var events : [Event] = []{
        didSet{
            saveEvent()
        }
    }
    
    private var eventsKey = "saved_events"
    
    init(){
        loadEvents()
    }
    
    func addEvent(event : Event){
        return events.append(event)
    }
    
    func deleteEvent(at offset: IndexSet){
        return events.remove(atOffsets: offset)
    }
    
    func saveEvent(){
        if let encoded = try? JSONEncoder().encode(events){
            UserDefaults.standard.set(encoded, forKey: eventsKey)
        }
    }
    
    func loadEvents(){
        if let savedData = UserDefaults.standard.data(forKey: eventsKey){
            let decodedEvents = try? JSONDecoder().decode([Event].self, from: savedData)
            events = decodedEvents ?? []
        }
    }
}
