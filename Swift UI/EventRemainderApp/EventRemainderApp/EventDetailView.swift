//
//  EventDetailView.swift
//  EventRemainderApp
//
//  Created by Shaik Areef on 10/03/25.
//

import SwiftUI

struct EventDetailView: View {
    let event: EventModel

    var body: some View {
        VStack(spacing: 20) {
            Text(event.title)
                .font(.largeTitle)
                .bold()

            Text(event.date, style: .date)
                .font(.title2)
                .foregroundColor(.gray)

            Text(event.description)
                .font(.body)
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle("Event Details")
    }
}

