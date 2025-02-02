import Foundation

struct Event: Codable {
    let name: String
    let date: String
    let time: String
    let location: String
    
    var eventDate: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: date)
    }

    var monthYear: String {
        guard let date = eventDate else { return "Unknown" }
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
}
