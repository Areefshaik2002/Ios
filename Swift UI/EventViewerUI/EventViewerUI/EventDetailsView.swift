import SwiftUI

struct EventDetailView: View {
    let event: Event

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(event.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Date: \(event.date)")
                .font(.title2)

            Text("Time: \(event.time)")
                .font(.title3)

            Text("Location: \(event.location)")
                .font(.title3)

            Spacer()
        }
        .padding()
        .navigationTitle("Event Details")
        .background(Color.mint)
    }
}
