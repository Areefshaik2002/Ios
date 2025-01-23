import UIKit
import Foundation

struct Event: Codable {
    let name: String
    let date: String
    let time: String
    let location: String
}

if let fileURL = Bundle.main.url(forResource: "events", withExtension: "json") {
    do {
        let data = try Data(contentsOf: fileURL)
        let events = try JSONDecoder().decode([Event].self, from: data)
        
        let allMonths = [
            "January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"
        ]
        
        var groupedEvents: [String: [Event]] = [:]
        
        for event in events {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            if let date = dateFormatter.date(from: event.date) {
                let monthFormatter = DateFormatter()
                monthFormatter.dateFormat = "MMMM"
                let month = monthFormatter.string(from: date)
                
                groupedEvents[month, default: []].append(event)
            }
        }
        
        let sortedMonths = allMonths.filter { groupedEvents.keys.contains($0) }
        
        for month in sortedMonths {
            if let eventsInMonth = groupedEvents[month] {
                print("\(month):")
                for event in eventsInMonth {
                    print("  \(event.name) at \(event.time), \(event.location)")
                }
            }
        }
        
    } catch {
        print("Error reading or parsing JSON: \(error)")
    }
} else {
    print("File not found")
}
