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
        //remove hardcode
        var allMonths = [
            "July 2024", "August 2024", "September 2024", "October 2024", "November 2024", "December 2024",
            "January 2025", "February 2025", "March 2025", "April 2025", "May 2025", "June 2025", "July 2025"
        ]
        
        var groupedEvents: [String: [Event]] = [:]
        //use better format/optimize it
        for event in events {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            if let date = dateFormatter.date(from: event.date) {
                let monthFormatter = DateFormatter()
                monthFormatter.dateFormat = "MMMM yyyy"
                let monthYear = monthFormatter.string(from: date)
                groupedEvents[monthYear, default: []].append(event)
            }
        }
        
        let sortedMonths = allMonths.filter { groupedEvents.keys.contains($0) }
        //use inbuilt sorting
        for month in sortedMonths {
            if let eventsInMonth = groupedEvents[month] {
                print("\(month):")
                
                let sortedEvents = eventsInMonth.sorted { event1, event2 in
                    let day1 = takeDayOnly(from: event1.name)
                    let day2 = takeDayOnly(from: event2.name)
                    return day1 < day2
                }
                
                for event in sortedEvents {
                    print("Event name:\(event.name), at time: \(event.time), location: \(event.location)")
                }
            }
        }
        
    } catch {
        print("Error reading or parsing JSON: \(error)")
    }
} else {
    print("File not found")
}

//remove the blunder and use date to sort
func takeDayOnly(from eventName: String) -> Int {
    if let match = eventName.split(separator: " ").last,
       let day = Int(match.replacingOccurrences(of: "+", with: "")) {
        return day
    }
    return 0
}
