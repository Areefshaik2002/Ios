//
//  CourtViewModel.swift
//  TenmatesUI
//
//  Created by Shaik Areef on 18/02/25.
//

import Foundation
import Combine
import SwiftUI
import Observation

let appColor = Color.init(red: 0.75, green: 1, blue: 0)
let appColorGradient = LinearGradient(colors: [Color(appColor).opacity(0.5), .black, Color(appColor).opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)

@available(iOS 17.0, *)
@Observable class EventViewModel{
    var events: Welcome?
    var errorMessage: String?
    
    func fetchEvent(eventID: Int) async {
        do {
            let fetchedEvent = try await fetchEventDetails(eventID: eventID )
            events = fetchedEvent
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

//Api calls
func fetchVerificationCode() async throws -> String {
    
    let urlString = "https://api-stage.tenmates.app/verifications/verify_sms_code"
    guard var urlComponents = URLComponents(string: urlString) else {
        throw URLError(.badURL)
    }
    
    urlComponents.queryItems = [
        URLQueryItem(name: "code", value: "123456"),
        URLQueryItem(name: "country_code", value: "91"),
        URLQueryItem(name: "mobile_number", value: "8300004515"),
        URLQueryItem(name: "region_code", value: "IN")
    ]
    
    guard let url = urlComponents.url else { throw URLError(.badURL) }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    if let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [String: Any],
       let verificationCode = jsonResponse["verification_code"] as? String {
        return verificationCode
    }
    
    throw URLError(.cannotParseResponse)
}

//Access token
func getToken() async throws -> String {
    let urlString = "https://api-stage.tenmates.app/oauth/token"
    guard let url = URL(string: urlString) else { throw URLError(.badURL) }
    
    let clientID = "gYanhpa87VxQqkJ-7J8fOy5ehRLvkdat6uWbtjpFUtQ"
    let clientSecret = "Wj9wd0jWkCVEPt2hKk3IK2QjUOy3fTMFzzykxRH0PDU"
    let username = "8300004515"
    let verificationCode = try await fetchVerificationCode()
    let grantType = "password"
    
    let bodyParams = [
        "client_id": clientID,
        "client_secret": clientSecret,
        "username": username,
        "verification_code": verificationCode,
        "grant_type": grantType
    ]
    
    let bodyData = bodyParams
        .map { "\($0.key)=\($0.value)" }
        .joined(separator: "&")
        .data(using: .utf8)
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    request.httpBody = bodyData
    
    let (data, response) = try await URLSession.shared.data(for: request)
    
    if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
        throw NSError(domain: "HTTP Error", code: httpResponse.statusCode, userInfo: nil)
    }
    
    if let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [String: Any],
       let accessToken = jsonResponse["access_token"] as? String {
        return accessToken
    }
    
    throw URLError(.cannotParseResponse)
}

//data fetching
func fetchEventDetails(eventID: Int) async throws -> Welcome {
    guard let url = URL(string: "https://api-stage.tenmates.app/events/\(eventID)") else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    request.setValue("Bearer \(try await getToken())", forHTTPHeaderField: "Authorization")
    request.setValue("application/vnd.prasthana.com; version=1", forHTTPHeaderField: "Accept")

    let (data, response) = try await URLSession.shared.data(for: request)

    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw URLError(.badServerResponse)
    }

    let decoder = JSONDecoder()
    return try decoder.decode(Welcome.self, from: data)
}

//date formatting function
func dateFormatter(from isoString: String, outputTimeZone: TimeZone = TimeZone(abbreviation: "UTC")!) -> String {
    let isoFormatter = ISO8601DateFormatter()
    isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    
    guard let date = isoFormatter.date(from: isoString) else {
        print("Failed to parse date from string.")
        return ""
    }
    
    let formatter = DateFormatter()
    formatter.dateFormat = "E, d MMM hh:mm a"
    formatter.timeZone = outputTimeZone
    
    return formatter.string(from: date)
}

//event initial data
func eventInitialDetailView(event: Event?) -> some View {
    let viewModel = EventViewModel()
    return VStack(alignment: .leading) {
        Text("Event Type")
            .foregroundStyle(.secondary).bold()
        HStack {
            Image(systemName: "trophy")
                .foregroundColor(appColor)
            Text(event?.eventType ?? "compete").bold()
            Spacer()
            ZStack {
                Color(appColor).opacity(0.2).cornerRadius(50)
                    .frame(width: 95, height: 38)
                HStack {
                    circleDesign(imageName: "lock.rotation.open").foregroundColor(.black)
                    Text("Public")
                }
            }
        }
        
        HStack {
            VStack(alignment: .leading , spacing: 8) {
                Text("Event Dynamic")
                    .bold()
                    .font(.callout)
                    .foregroundStyle(.secondary)
                if viewModel.events?.event?.opponentTeamName == nil{
                    Text("Play within my Team").bold()
                }
            }
            .padding(.top , -8)
        }
    }
    .padding(.horizontal , 10)
    .task {
        await viewModel.fetchEvent(eventID: 3926)
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
                    .foregroundColor(.gray)
                    .frame(width: 80, height: 30)
                    .background(Color(appColor.opacity(0.15)))
                    .cornerRadius(30)
            }
            .padding(.bottom, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(eventCourt?.eventCourtScheduleOptions ?? [], id: \ .id) { eventCourtScheduleOption in
                        optionDetails(eventCourtScheduleOption: eventCourtScheduleOption)
                    }
                }
            }
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
                NavigationLink(destination: EditCoachNavigation()) {
                    Text("Edit Player").underline().foregroundColor(appColor)
                }
            }
            .padding(.bottom, 16)
        }
    }
    .padding()
    .background(appColorGradient)
    .cornerRadius(10)
    .padding(.horizontal)
}

func optionDetails(eventCourtScheduleOption: EventCourtScheduleOption) -> some View {
    VStack(alignment: .leading) {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(appColor)
                    .padding(.trailing, 16)
                
                VStack(alignment: .leading) {
                    Text(dateFormatter(from: eventCourtScheduleOption.startTime ?? ""))
                    let duration = (eventCourtScheduleOption.duration ?? 0) / 3600
                    Text("\(duration)h")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            HStack(spacing: 16) {
                Image(systemName: "location.north.circle")
                    .foregroundColor(appColor)
                    .padding(.trailing, 16)
                
                VStack(alignment: .leading) {
                    Text(eventCourtScheduleOption.place?.name ?? "")
                    Text("\(eventCourtScheduleOption.place?.address ?? "")")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .frame(width: 330, height: 150)
        .background(Color.init(red: 0.85, green: 1, blue: 1).opacity(0.05))
    }
}


func images(imageName: String) -> some View {
    Image(systemName: imageName)
        .resizable()
        .scaledToFill()
        .frame(width: 35, height: 35)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 2))
        .shadow(radius: 3)
}

func circleDesign(imageName: String) -> some View {
    Circle()
        .fill(Color.init(red: 0.75, green: 0.9, blue: 0))
        .frame(width: 30, height: 30)
        .overlay {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
        }
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

func editAudienceView() -> some View {
    Text("Audience Edit View")
}

func coachView(event: Event?) -> some View {
    let appColor: Color = Color.init(red: 0.75, green: 0.9, blue: 0)
    return VStack(alignment: .leading, spacing: 8) {
        Text("Coach")
            .foregroundStyle(.secondary)
            .bold()
        HStack {
            HStack {
                if let coachImage = event?.eventCoaches?.first?.user?.avatarFileAttachmentURL {
                    AsyncImage(url: URL(string: coachImage))
                } else {
                    Image(systemName: "person.circle")
                        .font(.system(size: 30))
                }
                Text("\(event?.eventCoaches?.first?.user?.firstName ?? "") \(event?.eventCoaches?.first?.user?.lastName ?? "")").foregroundStyle(.secondary)
            }
            Spacer()
            NavigationLink(destination: EditCoachNavigation()) {
                Text("Edit Coach").underline().accentColor(appColor)
            }
        }
    }
    .padding(.all, 10)
}

func audienceViewEdit() -> some View {
    let appColor: Color = Color.init(red: 0.75, green: 0.9, blue: 0)
    return VStack(alignment: .leading, spacing: 8) {
        Text("Audience")
            .foregroundStyle(.secondary)
            .bold()
        HStack {
            HStack {
                images(imageName: "pic1")
                images(imageName: "pic2").offset(x: -14)
                images(imageName: "pic3").offset(x: -28)
                images(imageName: "pic4").offset(x: -42)
                Text("32 spectators").foregroundStyle(.secondary).offset(x: -42)
            }
            Spacer()
            NavigationLink(destination: editAudienceView()) {
                Text("Edit Audience").underline().accentColor(appColor)
            }
        }
    }
    .padding(.all, 10)
}

func teamView() -> some View {
    VStack(alignment: .leading, spacing: 8){
        Text("Team").foregroundStyle(.secondary).bold()
        HStack{
            Text("The Galactic Federation of PickleBall Pioneers")
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .bold()
            Spacer()
            HStack{
                circleDesign(imageName: "medal").foregroundColor(.black)
                Text("Spin Shot League")
                    .font(.caption)
                    .bold()
            }
            .padding(.all, 5)
            .frame(width: 170)
            .background(Color(appColor))
            .cornerRadius(50)
        }
        .padding()
        .background(Color(appColor))
        .cornerRadius(10)
    }
    .padding(.all, 10)
}

func tableTennisAnimationView(appColor: Color = Color(appColor)) -> some View {
    @State var scaleEffect: CGFloat = 0.1
    @State var opacity: Double = 0.1
    @State var showSparkles: Bool = false
    @State var paddleRotation: Double = -10
    @State var movingRight: Bool = true
    
    return ZStack {
        LinearGradient(colors: [appColor, .black],
                       startPoint: .top, endPoint: .bottom).opacity(0.6)
            .ignoresSafeArea()
        
        VStack {
            Spacer()
            
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 45, height: 45)
                    .scaleEffect(scaleEffect)
                    .opacity(opacity)
                    .animation(.easeInOut(duration: 1).delay(0.3), value: scaleEffect)
                
                Image(systemName: "tennis.racket")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.init(red: 0.85, green: 1, blue: 0))
                    .rotationEffect(.degrees(-190+paddleRotation))
                    .offset(x: 70, y: movingRight ? -30 : 40)
                    .animation(.easeInOut(duration: 0.6), value: movingRight)
                
                Image(systemName: "tennis.racket")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.init(red: 0.85, green: 1, blue: 0))
                    .rotationEffect(.degrees(paddleRotation))
                    .offset(x: -70, y: movingRight ? 30 : -20)
                    .animation(.easeInOut(duration: 0.6), value: movingRight)
                
                if showSparkles {
                    ForEach(0..<100, id: \.self) { index in
                        Circle()
                            .fill(Color.init(red: 0.85, green: 1, blue: 0))
                            .frame(width: 10, height: 10)
                            .offset(x: CGFloat.random(in: -100...100),
                                    y: CGFloat.random(in: -100...90))
                            .opacity(1 - Double(index) / 10)
                            .scaleEffect(1 + CGFloat(index) * 0.1)
                            .animation(.easeOut(duration: 0.1).repeatForever(autoreverses: true).delay(Double(index) * 0.05), value: showSparkles)
                    }
                }
                
                Text("The Event has\nbeen created!")
                    .font(.system(size: 30, weight: .bold))
                    .frame(width: 260, height: 100)
                    .padding(.top, 300)
                    .scaleEffect(scaleEffect)
                    .animation(.easeInOut(duration: 1).delay(0.3), value: scaleEffect)
                
            }
            .frame(width: 200, height: 200)
            Spacer()
        }
    }
    .onAppear {
        scaleEffect = 1
        opacity = 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            showSparkles = true
        }
    }
}



//@available(iOS 17.0, *)
//extension EventViewModel {
//    var id: Int? {
//        get { return self.id }
//        set { self.id = newValue }
//    }
//
//    var eventPlanType: String? {
//        get { return self.eventPlanType }
//        set { self.eventPlanType = newValue }
//    }
//
//    var eventType: String? {
//        get { return self.eventType }
//        set { self.eventType = newValue }
//    }
//
//    var rescheduled: Bool? {
//        get { return self.rescheduled }
//        set { self.rescheduled = newValue }
//    }
//
//    var firstStartTime: String? {
//        get { return self.firstStartTime }
//        set { self.firstStartTime = newValue }
//    }
//
//    var lastEndTime: String? {
//        get { return self.lastEndTime }
//        set { self.lastEndTime = newValue }
//    }
//
//    var rescheduledAt: String? {
//        get { return self.rescheduledAt }
//        set { self.rescheduledAt = newValue }
//    }
//
//    var createdBy: Int? {
//        get { return self.createdBy }
//        set { self.createdBy = newValue }
//    }
//
//    var status: String? {
//        get { return self.status }
//        set { self.status = newValue }
//    }
//
//    var originatorID: String? {
//        get { return self.originatorID }
//        set { self.originatorID = newValue }
//    }
//
//    var originatorType: String? {
//        get { return self.originatorType }
//        set { self.originatorType = newValue }
//    }
//
//    var allCourtsSameDate: Bool? {
//        get { return self.allCourtsSameDate }
//        set { self.allCourtsSameDate = newValue }
//    }
//
//    var allCourtsSameTime: Bool? {
//        get { return self.allCourtsSameTime }
//        set { self.allCourtsSameTime = newValue }
//    }
//
//    var allCourtsSameLocation: Bool? {
//        get { return self.allCourtsSameLocation }
//        set { self.allCourtsSameLocation = newValue }
//    }
//
//    var allCourtsDifferentScheduleOptions: Bool? {
//        get { return self.allCourtsDifferentScheduleOptions }
//        set { self.allCourtsDifferentScheduleOptions = newValue }
//    }
//
//    var globalPlayerConfirmationCounts: GlobalPlayerConfirmationCounts? {
//        get { return self.globalPlayerConfirmationCounts }
//        set { self.globalPlayerConfirmationCounts = newValue }
//    }
//
//    var showGlobalPlayerConfirmationCounts: Bool? {
//        get { return self.showGlobalPlayerConfirmationCounts }
//        set { self.showGlobalPlayerConfirmationCounts = newValue }
//    }
//
//    var scoresLastEnteredByName: String? {
//        get { return self.scoresLastEnteredByName }
//        set { self.scoresLastEnteredByName = newValue }
//    }
//
//    var scoresLastEnteredByPlayerID: String? {
//        get { return self.scoresLastEnteredByPlayerID }
//        set { self.scoresLastEnteredByPlayerID = newValue }
//    }
//
//    var scoresAcceptedByName: String? {
//        get { return self.scoresAcceptedByName }
//        set { self.scoresAcceptedByName = newValue }
//    }
//
//    var scoresAcceptedByPlayerID: String? {
//        get { return self.scoresAcceptedByPlayerID }
//        set { self.scoresAcceptedByPlayerID = newValue }
//    }
//
//    var scoreStatus: String? {
//        get { return self.scoreStatus }
//        set { self.scoreStatus = newValue }
//    }
//
//    var userPermissions: [String: UserPermission]? {
//        get { return self.userPermissions }
//        set { self.userPermissions = newValue }
//    }
//
//    var notesForEvent: String? {
//        get { return self.notesForEvent }
//        set { self.notesForEvent = newValue }
//    }
//
//    var missingPlayersCount: Int? {
//        get { return self.missingPlayersCount }
//        set { self.missingPlayersCount = newValue }
//    }
//
//    var discardedAt: String? {
//        get { return self.discardedAt }
//        set { self.discardedAt = newValue }
//    }
//
//    var opponentTeamType: String? {
//        get { return self.opponentTeamType }
//        set { self.opponentTeamType = newValue }
//    }
//
//    var globalPlayerChatRoom: String? {
//        get { return self.globalPlayerChatRoom }
//        set { self.globalPlayerChatRoom = newValue }
//    }
//
//    var opponentTeamName: String? {
//        get { return self.opponentTeamName }
//        set { self.opponentTeamName = newValue }
//    }
//
//    var assignType: String? {
//        get { return self.assignType }
//        set { self.assignType = newValue }
//    }
//
//    var allowParticipantsManagePlayers: Bool? {
//        get { return self.allowParticipantsManagePlayers }
//        set { self.allowParticipantsManagePlayers = newValue }
//    }
//
//    var playerPool: String? {
//        get { return self.playerPool }
//        set { self.playerPool = newValue }
//    }
//
//    var playersLimit: Int? {
//        get { return self.playersLimit }
//        set { self.playersLimit = newValue }
//    }
//
//    var rsvpLimit: Int? {
//        get { return self.rsvpLimit }
//        set { self.rsvpLimit = newValue }
//    }
//
//    var playerAcceptanceType: String? {
//        get { return self.playerAcceptanceType }
//        set { self.playerAcceptanceType = newValue }
//    }
//
//    var playerPoolGender: String? {
//        get { return self.playerPoolGender }
//        set { self.playerPoolGender = newValue }
//    }
//
//    var playerPoolAgeLimitType: String? {
//        get { return self.playerPoolAgeLimitType }
//        set { self.playerPoolAgeLimitType = newValue }
//    }
//
//    var playerPoolMinAge: String? {
//        get { return self.playerPoolMinAge }
//        set { self.playerPoolMinAge = newValue }
//    }
//
//    var playerPoolMaxAge: String? {
//        get { return self.playerPoolMaxAge }
//        set { self.playerPoolMaxAge = newValue }
//    }
//
//    var playerPoolNotes: String? {
//        get { return self.playerPoolNotes }
//        set { self.playerPoolNotes = newValue }
//    }
//
//    var withCoach: Bool? {
//        get { return self.withCoach }
//        set { self.withCoach = newValue }
//    }
//
//    var withAudience: Bool? {
//        get { return self.withAudience }
//        set { self.withAudience = newValue }
//    }
//
//    var attendanceDeadlineUnit: Int? {
//        get { return self.attendanceDeadlineUnit }
//        set { self.attendanceDeadlineUnit = newValue }
//    }
//
//    var attendanceDeadlineUnitType: String? {
//        get { return self.attendanceDeadlineUnitType }
//        set { self.attendanceDeadlineUnitType = newValue }
//    }
//
//    var homeTeamNotDecided: Bool? {
//        get { return self.homeTeamNotDecided }
//        set { self.homeTeamNotDecided = newValue }
//    }
//
//    var currentUserEventDetails: [CurrentUserEventDetail]? {
//        get { return self.currentUserEventDetails }
//        set { self.currentUserEventDetails = newValue }
//    }
//
//    var eventCourts: [EventCourt]? {
//        get { return self.eventCourts }
//        set { self.eventCourts = newValue }
//    }
//
//    var eventTeams: [String]? {
//        get { return self.eventTeams }
//        set { self.eventTeams = newValue }
//    }
//
//    var eventCoaches: [EventCoach]? {
//        get { return self.eventCoaches }
//        set { self.eventCoaches = newValue }
//    }
//
//    var eventAudiences: [String]? {
//        get { return self.eventAudiences }
//        set { self.eventAudiences = newValue }
//    }
//
//    var eventInvitees: [EventInvitee]? {
//        get { return self.eventInvitees }
//        set { self.eventInvitees = newValue }
//    }
//
//    var captainsChatRoom: String? {
//        get { return self.captainsChatRoom }
//        set { self.captainsChatRoom = newValue }
//    }
//}
