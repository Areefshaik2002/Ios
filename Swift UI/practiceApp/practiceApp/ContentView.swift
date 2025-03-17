//
//  ContentView.swift
//  practiceApp
//
//  Created by Shaik Areef on 11/03/25.
//

import SwiftUI

struct ContentView: View {

    var viewModel = EventViewModel()
    @State var showAddEvent = false
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.events.sorted{ $0.date < $1.date }){ event in
                    NavigationLink(destination: EventDetailView(event: event)){
                        EventRowView(event: event)
                    }
                }
                .onDelete(perform: viewModel.deleteEvent)
            }
            .navigationTitle("Event Remainder App")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {
                        showAddEvent = true
                    }){
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                }
            }
            .sheet(isPresented: $showAddEvent){
                AddEventView(viewModel: viewModel)
            }
        }
    }
}

struct EventRowView : View {
    
    
    var event: Event
    var body : some View {
        HStack{
            VStack(alignment: .leading, spacing: 8){
                Text(event.title)
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
    var viewModel : EventViewModel
    
    @State var title: String = ""
    @State var date: Date = Date()
    @State var description: String = ""
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Enter title", text: $title)
                DatePicker("choose date", selection: $date, displayedComponents: .date)
                TextField("Enter description", text: $description)
            }
            .navigationTitle("New Event")
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button("Save"){
                        let addEvent = Event(title: title, date: date, description: description)
                        viewModel.addEvent(event: addEvent)
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}

struct EventDetailView: View {
    var event : Event
    var body: some View {
        VStack(alignment: .center, spacing: 16){
            Text(event.title)
                .font(.system(size: 30))
            Text(event.date, style: .date)
                .font(.system(size: 24))
            Text(event.description)
                .font(.system(size: 16))
            Spacer()
        }
        .padding()
        .navigationTitle("Event Details")
    }
}
