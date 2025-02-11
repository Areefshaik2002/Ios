import SwiftUI

struct EventsListView: View {
    let eventsByMonth: [(String, [Event])] = loadEvents()

    var body: some View {
        NavigationView {
            List {
                ForEach(eventsByMonth, id: \.0) { month, events in
                    Section(header: Text(month).font(.title2).bold()) {
                        ForEach(events, id: \.name) { event in
                            NavigationLink(destination: EventDetailView(event: event)) {
                                EventRow(event: event)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Schedule")
        }
    }
}

struct EventRow: View {
    let event: Event

    var body: some View {
        HStack {
            VStack {
                Text(formattedDay(from: event.date))
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(formattedWeekday(from: event.date))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(width: 50)

            VStack(alignment: .leading) {
                Text(event.name)
                    .font(.headline)

                Text(event.time)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            Circle()
                .fill(Color.green)
                .frame(width: 30, height: 30)
                .overlay(Text("JP").foregroundColor(.white).font(.caption))
        }
    }
}
#Preview {
    EventsListView()
}
