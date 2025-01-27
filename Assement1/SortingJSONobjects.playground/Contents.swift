import UIKit

import UIKit
import Foundation

struct Event: Codable {
    let name: String
    let date: String
    let time: String
    let location: String
}

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"
let monthYearFormatter = DateFormatter()
monthYearFormatter.dateFormat = "MMMM yyyy"

func formattedMonthYear(from date: String) -> String? {
    guard let parsedDate = dateFormatter.date(from: date) else { return nil }
    return monthYearFormatter.string(from: parsedDate)
}

func getDayFromDate(dateString: String) -> Int? {
    guard let date = dateFormatter.date(from: dateString) else { return nil }
    let calendar = Calendar.current
    return calendar.component(.day, from: date)
}

func getDateFromMonthYear(monthYear: String) -> Date? {
    monthYearFormatter.dateFormat = "MMMM yyyy"
    return monthYearFormatter.date(from: monthYear)
}

if let fileURL = Bundle.main.url(forResource: "events", withExtension: "json") {
    do {
        let data = try Data(contentsOf: fileURL)
        let events = try JSONDecoder().decode([Event].self, from: data)
        
        
        var groupedEvents = Dictionary(grouping: events) { event in
            formattedMonthYear(from: event.date) ?? "Unknown"
        }
        
        let sortedMonthDates = groupedEvents.keys
            .compactMap { getDateFromMonthYear(monthYear: $0) }
            .sorted()
        
        let sortedMonths: [String] = sortedMonthDates.compactMap {
            return monthYearFormatter.string(from: $0)
        }

        for month in sortedMonths {
            if let eventsInMonth = groupedEvents[month] {
                print("\(month):")
                
                let sortedEvents = eventsInMonth.sorted { event1, event2 in
                    guard let day1 = getDayFromDate(dateString: event1.date),
                          let day2 = getDayFromDate(dateString: event2.date) else { return false }
                    return day1 < day2
                }
                
                for event in sortedEvents {
                    print("Event date: \(event.date), Event name: \(event.name), at time: \(event.time), location: \(event.location)")
                }
            }
        }
        
    } catch {
        print("Error reading or parsing JSON: \(error)")
    }
} else {
    print("File not found")
}

