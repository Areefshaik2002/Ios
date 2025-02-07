import Foundation

struct Event: Codable {
    let name: String
    let date: String
    let time: String
    let location: String
}

func eventDate(from dateString: String) -> Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.date(from: dateString)
}

func monthYear(from dateString: String) -> String {
    guard let date = eventDate(from: dateString) else { return "Unknown" }
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM yyyy"
    return formatter.string(from: date)
}

func formattedEventDate(from dateString: String) -> String {
    guard let date = eventDate(from: dateString) else { return "Unknown" }
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMMM  d yyyy"
    return formatter.string(from: date)
}

func loadEvents() -> [String: [Event]] {
    guard let url = Bundle.main.url(forResource: "events", withExtension: "json") else {
        print("File not found")
        return [:]
    }

    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        var events = try decoder.decode([Event].self, from: data)
        
         events.sort {
            (eventDate(from: $0.date) ?? Date()) < (eventDate(from: $1.date) ?? Date())
        }
        
        let groupedEvents = Dictionary(grouping: events) { monthYear(from: $0.date) }
        
        return groupedEvents
    } catch {
        print("Error decoding JSON: \(error)")
        return [:]
    }
}
