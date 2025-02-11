import SwiftUI

struct EventDetailView: View {
    let event: Event

    var body: some View {
        VStack(spacing: 20) {
            Text(event.name)
                .font(.title)
                .fontWeight(.bold)

            Text(" Date: \(formattedEventDate(from: event.date))")
                .font(.headline)

            Text(" Time: \(event.time)")
                .font(.headline)

            Text(" Location: \(event.location)")
                .font(.headline)

            Spacer()
        }
        .padding()
        .navigationTitle("Event Details")
    }
}

//func formattedEventDate(from dateString: String) -> String {
//    guard let date = eventDate(from: dateString) else { return "Unknown" }
//    let formatter = DateFormatter()
//    formatter.dateFormat = "EEEE, MMMM d yyyy"
//    return formatter.string(from: date)
//}
