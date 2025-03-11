//
//  ContentView.swift
//  EventRemainderApp
//
//  Created by Shaik Areef on 10/03/25.
//

import SwiftUI

struct ContentView: View {
    var viewModel = EventViewModel()
    @State private var showAddEvent = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.events.sorted { $0.date < $1.date }) { event in
                    NavigationLink(destination: EventDetailView(event: event)) {
                        EventRow(event: event)
                    }
                }
                .onDelete(perform: viewModel.deleteEvent)
            }
            .navigationTitle("Event Reminder")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showAddEvent = true }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                }
            }
            .sheet(isPresented: $showAddEvent) {
                AddEventView(viewModel: viewModel)
            }
        }
    }
}

struct EventRow: View {
    let event: EventModel

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.headline)
                Text(event.date, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.vertical, 5)
    }
}


struct AddEventView: View {
    @Environment(\.dismiss) var dismiss
    var viewModel: EventViewModel
    
    @State private var title = ""
    @State private var date = Date()
    @State private var description = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Event Title", text: $title)
                DatePicker("Select Date", selection: $date, displayedComponents: .date)
                TextField("Description", text: $description)
            }
            .navigationTitle("New Event")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let newEvent = EventModel(title: title, date: date, description: description)
                        viewModel.addEvent(newEvent)
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}
