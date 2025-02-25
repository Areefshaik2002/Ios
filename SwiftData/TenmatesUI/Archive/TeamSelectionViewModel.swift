////
////  TeamSelectionViewModel.swift
////  Tenmates
////
////  Created by sujith varma on 1/7/25.
////
//
//import Foundation
//
//@available(iOS 17.0, *)
//@Observable class TeamSelectionViewModel: NewBaseViewModel<TeamSelectionView> {
//    
//    var model: TeamSelectionModel
//    
//    let useCase: TeamSelectionUseCaseProtocol = TeamSelectionUseCase()
//
//    init(model: TeamSelectionModel) {
//        self.model = model
//    }
//    
//    func setIntialData() {
//        event = CreateEventManager.shared.event
//    }
//    
//    var topSectionTitle: String {
//        return self.screenMode == .userTeam ? APIResourceString.shared.teamSelectTeamSelectionTitle : APIResourceString.shared.opponentsOpponentSelectionTitle
//    }
//    var topSectionDescription: String {
//        return self.screenMode == .userTeam ? APIResourceString.shared.teamSelectTeamSelectionSubtext : APIResourceString.shared.opponentsOpponentSelectionSubtext
//    }
//    func playersCountText(_ team: Team?) -> String {
//        let count = team?.participantCount ?? 0
//        let playerText = count == 1 ? StringConstants.playerText : StringConstants.players.lowercased()
//        return "\(count) \(playerText)"
//    }
//
//    var isContinueButtonEnabled: Bool {
//        if screenMode == .userTeam {
//            return selectedUserTeam != nil
//        } else {
//            return selectedOpponentTeam != nil
//        }
//    }
//}
///// this extension for api calls and  setting requests functions
//@available(iOS 17.0, *)
//extension TeamSelectionViewModel {
//    func handleApiActions(completion: @escaping (_ isSuccess: Bool) -> Void) {
//        showLoader = true
//        
//        guard let eventId = event?.identifier else { return }
//        useCase.updateEvent(eventAPIRequestObject: updatedEvent, eventId: eventId) { result in
//            self.showLoader = false
//            switch result {
//            case .success(let response):
//                self.event = response.event
//                CreateEventManager.shared.event = response.event
//                completion(true)
//            case .failure(let error):
//                self.isApiError = true
//                self.showAlert.toggle()
//                self.alertMessage = error.localizedDescription.replacingOccurrences(of: "Validation failed: ", with: "")
//                completion(false)
//            }
//        }
//        
//    }
//    
//
//    var updatedEvent: EventAPIRequestObject {
//        
//        var eventAPIRequestObject = EventAPIRequestObject()
//
//        var eventRequest = EventReqObject()
//        var eventCourtsAttributes = [EventCourt]()
//
//        if let opponentTeamId = selectedOpponentTeam?.id {
//            
//            let existingEventTeams = self.event?.eventTeams
//            var eventTeamsAttributes = [EventTeamsAttributes]()
//
//            var myTeamAttributes = EventTeamsAttributes()
//            myTeamAttributes.id = existingEventTeams?.first?.id
//            myTeamAttributes.teamId = self.event?.eventTeams?.first?.teamID
//            eventTeamsAttributes.append(myTeamAttributes)
//            
//            var opponentTeamAttributes = EventTeamsAttributes()
//            opponentTeamAttributes.teamId = opponentTeamId
//            if existingEventTeams?.count ?? 0 >= 2 {
//                opponentTeamAttributes.id = self.event?.eventTeams?.last?.id
//            }
//            eventTeamsAttributes.append(opponentTeamAttributes)
//            
//            eventRequest.eventTeamsAttributes = eventTeamsAttributes
//            
//            eventRequest.opponentTeamType = OpponentTeamTypes.selectTeam.rawValue
//        }
//        /// for ball machinecourt and individual leson we are creating courts here itself
//        if self.event?.isBallMachineEvent == true || self.event?.isIndividualLessonEvent == true {
//            let eventCourt = EventCourt(matchType: NewMatchType.singles.rawValue,
//                                        order: 1)
//            eventCourtsAttributes.append(eventCourt)
//            
//            eventRequest.eventFullCourt = eventCourtsAttributes
//        }
//
//        eventAPIRequestObject.event = eventRequest
//        return eventAPIRequestObject
//    }
//    
//    func getTeams(search: String? = nil) {
//        self.showShimmer = true
//        
//        if !self.isFirstApiCall {
//            self.showSmallLoader = true
//        }
//        
//        let leagueId = self.event?.myTeam?.leagueId
//        let queryType = self.queryType(leagueId: leagueId)
//        
//        let excludeTeamId = (self.screenMode == .userTeam) ? nil : self.event?.myTeamIdFromCurrentUserEventDetail
//        
//        let captainTeams = self.screenMode == .userTeam ? true : nil
//        
//        useCase.getTeams(queryType: queryType,
//                         excludeTeamId: excludeTeamId,
//                         leagueId: leagueId,
//                         searchQuery: search, captainTeams: captainTeams) { response in
//            
//            switch response {
//            case .success(let teamListResponse):
//                self.isFirstApiCall = false
//                self.showSmallLoader = false
//                self.showShimmer = false
//                self.teams = teamListResponse.teams ?? []
//            case .failure(let error):
//                self.showSmallLoader = false
//                self.showShimmer = false
//                self.teams = []
//                self.isApiError = true
//                self.alertMessage = error.localizedDescription
//                self.showAlert.toggle()
//            }
//        }
//    }
//    func queryType(leagueId: Int?) -> String {
//        
//        switch self.screenMode {
//        case .userTeam:
//            return Teams.userTeams.rawValue
//        case .opponentTeam where leagueId != nil:
//            return Teams.leagueTeams.rawValue
//        default:
//            return Teams.nonLeagueTeams.rawValue
//        }
//    }
//}
//
//// this extension for get setter variables
//@available(iOS 17.0, *)
//extension TeamSelectionViewModel {
//    var teamsSearch: String? {
//        get { model.teamsSearch }
//        set { model.teamsSearch = newValue }
//    }
//    var teams: [Team]? {
//        get { model.teams }
//        set { model.teams = newValue }
//    }
//    var selectedUserTeam: Team? {
//        get { model.selectedUserTeam }
//        set { model.selectedUserTeam = newValue }
//    }
//    var selectedOpponentTeam: Team? {
//        get { model.selectedOpponentTeam } 
//        set { model.selectedOpponentTeam = newValue }
//    }
//    var isFirstApiCall: Bool {
//        get { model.isFirstApiCall }
//        set { model.isFirstApiCall = newValue }
//    }
//    var showSmallLoader: Bool {
//        get { model.showSmallLoader }
//        set { model.showSmallLoader = newValue }
//    }
//    var navigateToEventType: Bool {
//        get { model.navigateToEventType }
//        set { model.navigateToEventType = newValue }
//    }
//    var navigateToCourtsCount: Bool {
//        get { model.navigateToCourtsCount }
//        set { model.navigateToCourtsCount = newValue }
//    }
//    var navigateToCourtDetails: Bool {
//        get { model.navigateToCourtDetails }
//        set { model.navigateToCourtDetails = newValue }
//    }
//    var screenMode: TeamSelection {
//        get { model.screenMode }
//        set { model.screenMode = newValue }
//    }
//    var event: Event? {
//        get { model.event }
//        set { model.event = newValue }
//    }
//    
//    var navigateToDefineHomeAwayTeamView: Bool {
//        get { model.navigateToDefineHomeAwayTeamView }
//        set { model.navigateToDefineHomeAwayTeamView = newValue }
//    }
//
//    var navigateToNewTeamCreationView: Bool {
//        get { model.navigateToNewTeamCreationView }
//        set { model.navigateToNewTeamCreationView = newValue }
//    }
//
//    
//}
