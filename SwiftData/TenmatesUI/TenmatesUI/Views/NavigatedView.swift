//
//  NavigatedView.swift
//  TenmatesUI
//
//  Created by Shaik Areef on 17/02/25.
//

import SwiftUI
import Combine

struct NavigatedView: View {
    
    @StateObject var courtViewModel : EventViewModel
    
    var body: some View{
            TableTennisAnimationView.init()
            VStack(alignment: .center, spacing: 20){
                Text("The Event has\nbeen created!")
                    .font(.system(size: 30, weight: .bold))
                    .frame(width: 260, height: 100)
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
                        Text("\(courtViewModel.courts.count) courts")
                            .font(.system(size: 24))
                            .offset(x:20)
                    }
                    HStack{
                        Images(imageName: "pic1")
                        Images(imageName: "pic2")
                            .offset(x: -20)
                        Images(imageName: "pic1")
                            .offset(x: -30)
                        Text("Micheal, Louise + 32 players")
                            .offset(x: -20)
                    }
                }
                .frame(width: 350, height: 120)
                .background(Color.init(red: 0.85, green: 1, blue: 0).opacity(0.15))
                .cornerRadius(12)
                
                NavigationLink(destination: ViewSchedule(), label: {
                    GreenButton(buttonLabel: "View Schedule")
                })
                NavigationLink(destination: ViewEventDetails(), label: {
                    BlackButton(buttonLabel: "View Event Details")
                })
            }
        }
    }
#Preview {
    NavigatedView(courtViewModel: EventViewModel())
}
