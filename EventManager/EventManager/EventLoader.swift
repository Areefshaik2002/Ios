import Foundation

func loadEvents() -> [String: [Event]] {
    guard let url = Bundle.main.url(forResource: "events", withExtension: "json") else {
        print("File not found")
        return [:]
    }

    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        var events = try decoder.decode([Event].self, from: data)
        
        // Sort by date
        events.sort { ($0.eventDate ?? Date()) < ($1.eventDate ?? Date()) }
        
        // Group by month
        let groupedEvents = Dictionary(grouping: events) { $0.monthYear }
        
        return groupedEvents
    } catch {
        print("Error decoding JSON: \(error)")
        return [:]
    }
}
