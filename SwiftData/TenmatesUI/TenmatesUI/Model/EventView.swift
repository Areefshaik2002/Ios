import SwiftUI
import Combine
import Foundation

struct EventView: View {
    
    var viewModel = EventViewModel()
    
    var body: some View {
        NavigationStack {
            
            reviewHeader
            
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    
                    eventInitialDetailView(event: viewModel.events?.event)
                    
                    if (viewModel.events?.event?.opponentTeamName != nil) {
                        teamView()
                    }
                    if viewModel.events?.event?.eventCoaches?.first?.isCoach != nil {
                        coachView(event: viewModel.events?.event)
                    }
                    if viewModel.events?.event?.withAudience ?? false {
                        audienceViewEdit()
                    }
                }
                
                courtDetails
                ForEach(viewModel.events?.event?.eventCourts ?? [], id: \.id) { court in
                    courtView(eventCourt: court)
                }
                .padding(.bottom, 20)
            }
            .navigationTitle("Review")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) { backButton }
                ToolbarItem(placement: .topBarTrailing) { questionMarkMessageButton }
                ToolbarItem(placement: .topBarTrailing) { closeButton }
            }
            publishNowNavigation
            saveDraftNavigation
        }
        .task{
            await viewModel.fetchEvent(eventID: 3926)
        }
    }
}

var reviewHeader: some View{
    VStack(alignment: .leading, spacing: 8) {
        Text("Review")
            .font(.title)
            .bold()
        Text("It's time to review your event information before publishing it")
            .font(.headline)
            .foregroundStyle(.secondary)
    }
    .padding(.vertical)
}

//var viewModel = EventViewModel()
//var eventType: some View {
//    VStack{
//        EventInitialDetailView(event: viewModel.event?.event)
//        
//        if (viewModel.event?.event?.opponentTeamName != nil) {
//            teamView()
//        }
//        if viewModel.event?.event?.eventCoaches?.first?.isCoach != nil {
//            coachView(event: viewModel.event?.event)
//        }
//        if viewModel.event?.event?.withAudience ?? false {
//            AudienceViewEdit()
//        }
//    }
//}

var courtDetails : some View{
    Text("Courts")
        .bold()
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
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
    NavigationLink(destination: NavigatedView(ViewModel: EventViewModel())) {
        greenButton(buttonLabel: "Publish now")
    }
}

var saveDraftNavigation : some View{
    NavigationLink(destination: NavigatedView(ViewModel: EventViewModel())) {
        blackButton(buttonLabel: "Save as a Draft")
    }
}

#Preview {
    EventView()
}

//struct EventInitialDetailView: View {
//    let event : Event?
//    var viewModel = EventViewModel()
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("Event Type")
//                .foregroundStyle(.secondary).bold()
//            HStack {
//                Image(systemName: "trophy")
//                    .foregroundColor(appColor)
//                Text(event?.eventType ?? "compete").bold()
//                Spacer()
//                ZStack {
//                    Color(appColor).opacity(0.2).cornerRadius(50)
//                        .frame(width: 95, height: 38)
//                    HStack {
//                        circleDesign(imageName: "lock.rotation.open").foregroundColor(.black)
//                        Text("Public")
//                    }
//                }
//            }
//            .offset(y: -7)
//            
//            HStack {
//                VStack(alignment: .leading , spacing: 8) {
//                    Text("Event Dynamic")
//                        .bold()
//                        .font(.callout)
//                        .foregroundStyle(.secondary)
//                    if viewModel.events?.event?.opponentTeamName == nil{
//                        Text("Play within my Team").bold()
//                    }
//                }
//                .padding(.top , -8)
//            }
//        }
//        .padding(.horizontal , 10)
//        .task {
//            await viewModel.fetchEvent(eventID: "3926")
//        }
//    }
//}
//struct CourtView: View {
//    var eventCourt: EventCourt?
//    var body: some View {
//        VStack (alignment: .leading){
//            VStack(alignment: .leading, spacing: 10) {
//                HStack {
//                    Text("Court \(eventCourt?.order ?? 0)")
//                        .font(.headline)
//                    Spacer()
//                    Text(eventCourt?.matchType ?? "")
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                    .frame(width: 80, height: 30).background(Color(appColor.opacity(0.15))).cornerRadius(30)}
//                .padding(.bottom, 10)
//                ScrollView(.horizontal , showsIndicators: false) {
//                    LazyHStack {
//                        ForEach(eventCourt?.eventCourtScheduleOptions ?? [] , id: \.id) { eventCourtScheduleOption in
//                            OptionDetails(eventCourtScheduleOption: eventCourtScheduleOption)
//                        }
//                    }
//                }
//            }
//                HStack {
//                    if (eventCourt?.matchType ?? "") == "mt_singles"{
//                        Images(imageName: "person.circle")
//                        Images(imageName: "person.circle")
//                            .offset(x: -16)
//                        Text("2 players")
//                    }else if (eventCourt?.matchType ?? "") == "mt_doubles"{
//                        Images(imageName: "person.circle")
//                        Images(imageName: "person.circle")
//                            .offset(x: -16)
//                        Images(imageName: "person.circle")
//                            .offset(x: -32)
//                        Images(imageName: "person.circle")
//                            .offset(x: -48)
//                        Text("4 players")
//                            
//                    }
//                    
//                    Spacer()
//                    
//                    NavigationStack {
//                        NavigationLink(destination: EditCoachNavigation()) {
//                            Text("Edit Player").underline().foregroundColor(appColor)
//                        }
//                    }
//                    .padding(.bottom, 16)
//                }
//            }
//            .padding()
//            .background(appColorGradient)
//            .cornerRadius(10)
//            .padding(.horizontal)
//        }
//    }

//struct OptionDetails: View {
//    let eventCourtScheduleOption: EventCourtScheduleOption
//    var body: some View {
//        VStack(alignment: .leading){
//            VStack(alignment: .leading) {
//                HStack {
//                    Image(systemName: "calendar")
//                        .foregroundColor(appColor)
//                        .padding(.trailing, 16)
//                    
//                    VStack(alignment: .leading) {
//                        Text(dateFormatter(from: eventCourtScheduleOption.startTime ?? ""))
//                        let duration = (eventCourtScheduleOption.duration ?? 0) / 3600
//                        Text("\(duration)h")
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                    }
//                }
//                Spacer()
//                HStack(spacing: 16){
//                    Image(systemName: "location.north.circle")
//                        .foregroundColor(appColor)
//                        .padding(.trailing, 16)
//                    
//                    VStack(alignment: .leading) {
//                        Text(eventCourtScheduleOption.place?.name ?? "")
//                        Text("\(eventCourtScheduleOption.place?.address ?? "")")
//                            .font(.subheadline)
//                        .foregroundColor(.gray)}} 
//            }
//            .padding()
//            .frame(width: 330, height: 150)
//            .background(Color.init(red: 0.85, green: 1, blue: 1).opacity(0.05))
//        }
//    }
//}

//struct Images: View {
//    var imageName: String
//    var body: some View {
//        Image(systemName: imageName)
//            .resizable()
//            .scaledToFill()
//            .frame(width: 35, height: 35)
//            .clipShape(Circle())
//            .overlay(Circle().stroke(Color.white, lineWidth: 2))
//            .shadow(radius: 3)
//    }
//}
//struct circleDesign: View {
//    var imageName: String
//    var body: some View {
//        Circle()
//            .fill(Color.init(red: 0.75, green: 0.9, blue: 0))
//            .frame(width: 30, height: 30)
//            .overlay(content: {
//                Image(systemName: imageName)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 30, height: 30)
//            })
//    }
//}

//struct GreenButton: View {
//    
//    var buttonLabel: String
//    var body: some View{
//        Text(buttonLabel)
//            .font(.headline)
//            .foregroundColor(.black)
//            .padding()
//            .frame(width: 360 )
//            .background(Color(appColor))
//            .overlay(
//                RoundedRectangle(cornerRadius: 8)
//                    .stroke(Color.white, lineWidth: 1)
//            )
//            .cornerRadius(8)
//    }
//}

//struct BlackButton: View {
//    
//    var buttonLabel: String
//    
//    var body: some View {
//        Text(buttonLabel)
//            .font(.headline)
//            .foregroundColor(.white)
//            .padding()
//            .frame(width: 360 )
//            .background(Color.black)
//            .overlay(
//                RoundedRectangle(cornerRadius: 8)
//                    .stroke(Color.white, lineWidth: 1)
//            )
//            .cornerRadius(8)
//    }
//}
//
//struct EditAudienceView: View {
//    var body: some View {
//        Text("Audience Edit View")
//    }
//}

//struct coachView: View {
//    let event : Event?
//    var appColor:Color = Color.init(red: 0.75, green: 0.9, blue: 0)
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            Text("Coach")
//                .foregroundStyle(.secondary)
//                .bold()
//            HStack {
//                HStack {
//                    if let coachImage = event?.eventCoaches?.first?.user?.avatarFileAttachmentURL {
//                        AsyncImage(url: URL(string: coachImage))
//                    }
//                    else {
//                        Image(systemName: "person.circle")
//                            .font(.system(size: 30))
//                    }
//                    
//                    Text("\(event?.eventCoaches?.first?.user?.firstName ?? "") \(event?.eventCoaches?.first?.user?.lastName ?? "")").foregroundStyle(.secondary)
//                }
//                Spacer()
//                NavigationLink(destination: EditCoachNavigation()) {
//                    Text("Edit Coach").underline().accentColor(appColor)
//                }
//            }
//        }
//        .padding(.all,10)
//    }
//}

//struct AudienceViewEdit: View {
//    var appColor:Color = Color.init(red: 0.75, green: 0.9, blue: 0)
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            Text("Audience")
//                .foregroundStyle(.secondary)
//                .bold()
//            HStack {
//                HStack {
//                    images(imageName: "pic1")
//                    images(imageName: "pic2")
//                        .offset(x: -14)
//                    images(imageName: "pic3")
//                        .offset(x: -28)
//                    images(imageName: "pic4")
//                        .offset(x: -42)
//                    Text("32 spectators").foregroundStyle(.secondary)
//                        .offset(x: -42)
//                }
//                Spacer()
//                NavigationLink(destination: EditAudienceView()) {
//                    Text("Edit Audience").underline().accentColor(appColor)
//                }
//            }
//        }
//        .padding(.all,10)
//    }
//}

//struct teamView: View {
//    
//    var viewModel = EventViewModel()
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8){
//            Text("Team").foregroundStyle(.secondary).bold()
//            HStack{
//                Text("The Galactic Federation of PickleBall Pioneers")
//                    .multilineTextAlignment(.leading)
//                    .lineLimit(2)
//                    .bold()
//                Spacer()
//                HStack{
//                    circleDesign(imageName: "medal").foregroundColor(.black)
//                    Text("Spin Shot League")
//                        .font(.caption)
//                        .bold()
//                }
//                .padding(.all, 5)
//                .frame(width: 170)
//                .background(Color.init(red: 0.85, green: 1, blue: 0).opacity(0.2))
//                .cornerRadius(50)
//            }
//            .padding()
//            .background(Color.init(red: 0.85, green: 1, blue: 0).opacity(0.1))
//            .cornerRadius(10)
//        }
//        .padding(.all,10)
//    }
//}

//struct TableTennisAnimationView: View {
//    @State private var scaleEffect: CGFloat = 0.1
//    @State private var opacity: Double = 0.1
//    @State private var showSparkles: Bool = false
//    @State private var paddleRotation: Double = -10
//    @State private var movingRight: Bool = true
//    var appColor:Color = Color.init(red: 0.75, green: 0.9, blue: 0)
//    
//    
//    var body: some View {
//        ZStack {
//            LinearGradient(colors: [appColor, .black],
//                           startPoint: .top, endPoint: .bottom).opacity(0.6)
//                .ignoresSafeArea()
//            
//            VStack {
//                Spacer()
//                
//                ZStack {
//                    Circle()
//                        .fill(Color.white)
//                        .frame(width: 45, height: 45)
//                        .scaleEffect(scaleEffect)
//                        .opacity(opacity)
//                        .animation(.easeInOut(duration: 1).delay(0.3), value: scaleEffect)
//                    
//                    Image(systemName: "tennis.racket")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 100, height: 100)
//                        .foregroundColor(Color.init(red: 0.85, green: 1, blue: 0))
//                        .rotationEffect(.degrees(-190+paddleRotation))
//                        .offset(x: 70, y: movingRight ? -30 : 40)
//                        .animation(.easeInOut(duration: 0.6), value: movingRight)
//                    
//                    Image(systemName: "tennis.racket")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 100, height: 100)
//                        .foregroundColor(Color.init(red: 0.85, green: 1, blue: 0))
//                        .rotationEffect(.degrees(paddleRotation))
//                        .offset(x: -70, y: movingRight ? 30 : -20)
//                        .animation(.easeInOut(duration: 0.6), value: movingRight)
//                    
//                    if showSparkles {
//                        ForEach(0..<100, id: \.self) { index in
//                            Circle()
//                                .fill(Color.init(red: 0.85, green: 1, blue: 0))
//                                .frame(width: 10, height: 10)
//                                .offset(x: CGFloat.random(in: -100...100),
//                                        y: CGFloat.random(in: -100...90))
//                                .opacity(1 - Double(index) / 10)
//                                .scaleEffect(1 + CGFloat(index) * 0.1)
//                                .animation(.easeOut(duration: 0.1).repeatForever(autoreverses: true).delay(Double(index) * 0.05), value: showSparkles)
//                        }
//                    }
//                    
//                    Text("The Event has\nbeen created!")
//                        .font(.system(size: 30, weight: .bold))
//                        .frame(width: 260, height: 100)
//                        .padding(.top, 300)
//                        .scaleEffect(scaleEffect)
//                        .animation(.easeInOut(duration: 1).delay(0.3), value: scaleEffect)
//                    
//                }
//                .frame(width: 200, height: 200)
//                Spacer()
//            }
//        }
//        .onAppear {
//            scaleEffect = 1
//            opacity = 1
//            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                showSparkles = true
//            }
//        }
//    }
//}


