import SwiftUI

import SwiftUI

struct EventsView: View {
    let month: String
    let events: [Event]

    var body: some View {
        List(events, id: \.name) { event in
            NavigationLink(destination: EventDetailView(event: event)) {
                VStack(alignment: .leading) {
                    Text(event.name)
                        .font(.headline)
                    Text(event.date)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
            }
            .listRowBackground(Color.white)
        }
        .navigationTitle(month)
        .background(Color.mint)
    }
}
