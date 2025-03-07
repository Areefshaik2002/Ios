//
//  NavigatedView.swift
//  TenmatesUI
//
//  Created by Shaik Areef on 17/02/25.
//

import SwiftUI
import Combine

struct NavigatedView: View {
    @State private var scaleEffect: CGFloat = 0.1
    var ViewModel = EventViewModel()
    var eventCourts: EventCourt?
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        tableTennisAnimationView()
        VStack(alignment: .center, spacing: 20){
            Text("Get ready to rally! Your pickelball event is officially set. Gather your paddles, and let the fun begin")
                .multilineTextAlignment(.center)
                .font(.system(size: 18))
                .frame(width: 360, height: 70)
            
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "book")
                        .foregroundColor(.init(red: 0.85, green: 1, blue: 0))
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                    Text("\(eventCourts?.eventCourtScheduleOptions?.count ?? 0) courts")
                        .font(.system(size: 24))
                        .offset(x:20)
                }
                HStack{
                    images(imageName: "person.circle")
                    images(imageName: "person.circle")
                        .offset(x: -20)
                    images(imageName: "person.circle")
                        .offset(x: -30)
                    Text("Micheal, Louise + 32 players")
                        .offset(x: -20)
                }
            }
            .frame(width: 350, height: 120)
            .background(Color.init(red: 0.85, green: 1, blue: 0).opacity(0.15))
            .cornerRadius(12)
            
            NavigationLink(destination: ViewSchedule(), label: {
                greenButton(buttonLabel: "View Schedule")
            })
            NavigationLink(destination: ViewEventDetails(), label: {
                blackButton(buttonLabel: "View Event Details")
            })
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color(red: 180/255, green: 215/255, blue: 0))
                            .frame(width: 20, height: 20)
                            .font(.system(size: 24, weight: .bold))
                    }
                }
            }
        }
    }
}

