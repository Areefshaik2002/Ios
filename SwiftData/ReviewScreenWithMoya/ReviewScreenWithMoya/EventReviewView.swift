//
//  ContentView.swift
//  ReviewScreenWithMoya
//
//  Created by Shaik Areef on 26/02/25.
//

import SwiftUI

struct EventReviewView: View {
    
    @State var viewModel = EventReviewViewModel()
    var body: some View {
        NavigationStack {
            mainContent
                .navigationBarTitle("Review", displayMode: .inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){ questionMarkMessageButton }
                    ToolbarItem(placement: .navigationBarTrailing){ closeButton }
                    ToolbarItem(placement: .navigationBarLeading){ backButton }
                }
        }
        .task {
            viewModel.getData(eventId: 3926)
        }
        publishNowNavigation
        saveDraftNavigation
    }
    
    var mainContent: some View {
        VStack(alignment: .leading, spacing: 16){
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading, spacing: 16){
                    headerSection
                    eventTypeView
                    eventDynamicView
                    coachView
                    courtDetails
                }
            }
        }
        .padding(.horizontal, 8)
    }
    
    var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Review")
                .font(.system(size: 24, weight: .bold))
            Text("It's time to review your event information before publishing it!")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.secondary)
        }
    }
    
    var eventTypeView: some View {
        VStack(alignment: .leading,spacing: 8) {
            Text("Event Type")
                .foregroundStyle(.secondary).bold()
                .font(.system(size: 16))
            
            HStack ( spacing: 8 ) {
                Image(systemName: "trophy.fill")
                    .foregroundColor(appColor)
                    .font(.system(size: 16))
                if let event = viewModel.events?.event?.eventType{
                    Text(event)
                        .font(.system(size: 16, weight: .medium))
                }else{
                    Text("Unknown")
                }
                Spacer()
                HStack{
                    circleDesign(imageName: "lock.open")
                        .foregroundColor(.black)
                    Text("Public")
                        .font(.system(size: 12))
                }
                .frame(width: 80, height: 30)
                .background(Color(appColor.opacity(0.3)))
                .cornerRadius(24)
            }
        }
    }
    
    var eventDynamicView: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Event Dynamic")
                .foregroundStyle(.secondary).bold()
                .font(.system(size: 16))
            Text("Play within my Team")
        }
    }
    
    var teamView: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Team")
                .foregroundStyle(.secondary).bold()
                .font(.system(size: 16))
            HStack{
                if let team = viewModel.events?.event?.eventTeams?.first {
                    Text(team)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    HStack{
                        circleDesign(imageName: "medal")
                        if let league = viewModel.events?.event?.eventTeams?.description{
                            Text(league)
                        }
                    }
                }
            }
        }
    }
    
    
    var coachView: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Coach")
                .foregroundStyle(.secondary).bold()
                .font(.system(size: 16))
            HStack{
                if let image = viewModel.events?.event?.eventCoaches?.first?.user?.avatarFileAttachmentURL{
                    AsyncImage(url: URL(string: image))
                }else{
                    images(imageName: "person.circle")
                        .fontWeight(.medium)
                }
                let firstName = viewModel.events?.event?.eventCoaches?.first?.user?.firstName ?? "firstname"
                let lastName  = viewModel.events?.event?.eventCoaches?.first?.user?.lastName ?? "lastname"
                Text("\(firstName) \(lastName)")
                    .foregroundStyle(.secondary)
                Spacer()
                Text("Edit Coach")
                    .font(.system(size: 16))
                    .underline()
                    .foregroundColor(appColor)
            }
        }
    }
    
    var courtDetails : some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Courts")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            ForEach(viewModel.events?.event?.eventCourts ?? [], id: \.id) { court in
                courtView(eventCourt: court)
            }
        }
    }
    
    func courtView(eventCourt: EventCourt?) -> some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Court \(eventCourt?.order ?? 0)")
                        .font(.headline)
                    Spacer()
                    Text(eventCourt?.matchType ?? "")
                        .font(.subheadline)
                        .frame(width: 100, height: 30)
                        .background(Color(appColor.opacity(0.15)))
                        .cornerRadius(24)
                }
                .padding(.bottom, 10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(eventCourt?.eventCourtScheduleOptions ?? [], id: \ .id) { eventCourtScheduleOption in
                            optionDetails(eventCourtScheduleOption: eventCourtScheduleOption)
                        }
                    }
                }
                .scrollDisabled(eventCourt?.eventCourtScheduleOptions?.count ?? 0 <= 1)
            }
            

            
            HStack {
                if (eventCourt?.matchType ?? "") == "mt_singles" {
                    images(imageName: "person.circle")
                    images(imageName: "person.circle").offset(x: -16)
                    Text("2 players")
                } else if (eventCourt?.matchType ?? "") == "mt_doubles" {
                    images(imageName: "person.circle")
                    images(imageName: "person.circle").offset(x: -16)
                    images(imageName: "person.circle").offset(x: -32)
                    images(imageName: "person.circle").offset(x: -48)
                    Text("4 players")
                }
                Spacer()
                NavigationStack {
//                    NavigationLink(destination: EditCoachNavigation()) {
                    Text("Edit Player").underline().foregroundColor(appColor)
//                    }
                }
                .padding(.bottom, 16)
            }
        }
        .padding()
        .background(appColor.opacity(0.1))
        .cornerRadius(12)
        .padding(.horizontal)
    }
    
    func optionDetails(eventCourtScheduleOption: EventCourtScheduleOption) -> some View {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(Color(appColor))
                        .padding(.trailing, 16)
                    
                    VStack(alignment: .leading) {
                        Text(eventCourtScheduleOption.startTime ?? "date")
                        let duration = (eventCourtScheduleOption.duration ?? 0) / 3600
                        Text("\(duration)h")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                HStack(spacing: 16) {
                    Image(systemName: "location.north.circle")
                        .foregroundColor(Color(appColor))
                        .padding(.trailing, 16)
                    
                    VStack(alignment: .leading) {
                        Text(eventCourtScheduleOption.place?.name ?? "")
                        Text("\(eventCourtScheduleOption.place?.address ?? "")")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .frame(width: 300, height: 140)
            .background(appColorGradient.opacity(1))
            .cornerRadius(12)
            .padding(.horizontal, 16)
    }

    var backButton : some View{
        Button(action: {
            print("Back button tapped")
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(appColor)
        }
    }
    var questionMarkMessageButton : some View{
        Button(action: {
            print("Help button tapped")
        }) {
            Image(systemName: "questionmark.message")
                .foregroundColor(appColor)
        }
    }
    var closeButton : some View{
        Button(action: {
            print("Exit button tapped")
        }) {
            Image(systemName: "multiply")
                .foregroundColor(appColor)
        }
    }
    var publishNowNavigation : some View{
//        NavigationLink(destination: NavigatedView(ViewModel: EventReviewViewModel())) {
            greenButton(buttonLabel: "Publish now")
//        }
    }

    var saveDraftNavigation : some View{
//        NavigationLink(destination: NavigatedView(ViewModel: EventReviewViewModel())) {
            blackButton(buttonLabel: "Save as a Draft")
//        }
    }
    
    func greenButton(buttonLabel: String) -> some View {
        Text(buttonLabel)
            .font(.headline)
            .foregroundColor(.black)
            .padding()
            .frame(width: 360)
            .background(Color(appColor))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.white, lineWidth: 1)
            )
            .cornerRadius(8)
    }

    func blackButton(buttonLabel: String) -> some View {
        Text(buttonLabel)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 360)
            .background(Color.black)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.white, lineWidth: 1)
            )
            .cornerRadius(8)
    }

    
    func circleDesign(imageName: String) -> some View {
        Circle()
            .fill(Color(appColor))
            .frame(width: 25, height: 25)
            .overlay(content: {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
            })
    }
    
    func images(imageName: String) -> some View {
        Image(systemName: imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 25, height: 25)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 3)
    }
    
//    func getScheduleOptionDate(eventCourtScheduleOption: EventCourtScheduleOption) -> String {
//        
//        let date = DateFormatter.globalFormatter.date(from: eventCourtScheduleOption.startTime ?? "")
//        
//        return DateFormatter.longDateShortTimeFormatter.string(from: date ?? Date())
//        
//    }
    

}
