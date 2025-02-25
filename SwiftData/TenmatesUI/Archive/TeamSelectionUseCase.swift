////
////  TeamSelectionUseCase.swift
////  Tenmates
////
////  Created by sujith varma on 1/7/25.
////
//
//import Foundation
//
//import Foundation
//
//protocol TeamSelectionUseCaseProtocol {
//    func getTeams(queryType: String,
//                  excludeTeamId: Int?,
//                  leagueId: Int?,
//                  searchQuery: String?,
//                  captainTeams: Bool?,
//                  completion: @escaping (Result<TeamListResponse, Error>) -> Void)
//    func updateEvent(eventAPIRequestObject: EventAPIRequestObject,
//                     eventId: Int,
//                     completion: @escaping (Result<EventResponse, Error>) -> Void)
//
//}
//
//class TeamSelectionUseCase: TeamSelectionUseCaseProtocol {
//    func getTeams(queryType: String,
//                  excludeTeamId: Int?,
//                  leagueId: Int?,
//                  searchQuery: String?,
//                  captainTeams: Bool?,
//                  completion: @escaping (Result<TeamListResponse, Error>) -> Void) {
//        AuthenticatedNetworkManager.shared.getTeams(queryType: queryType,
//                                                    leagueId: leagueId,
//                                                    excludeTeamId: excludeTeamId,
//                                                    archived: false,
//                                                    searchQuery: searchQuery,
//                                                    captainTeams: captainTeams) { response in
//            completion(response)
//        }
//    }
//    func updateEvent(eventAPIRequestObject: EventAPIRequestObject, eventId: Int, completion: @escaping (Result<EventResponse, any Error>) -> Void) {
//        AuthenticatedNetworkManager.shared.updateEvent(eventAPIRequestObject: eventAPIRequestObject,
//                                                       eventId: eventId) { response in
//            completion(response)
//        }
//    }
//}
