//
//  EventReviewModel.swift
//  MoyaFrameworkReviewScreen
//
//  Created by Shaik Areef on 28/02/25.
//

import Foundation

struct Welcome: Codable {
    let event: Event?
}

struct Event: Codable {
    let id: Int?
    let eventPlanType, eventType: String?
    let rescheduled: Bool?
    let firstStartTime, lastEndTime: String?
    let rescheduledAt: String?
    let createdBy: Int?
    let status: String?
    let originatorID, originatorType: String?
    let allCourtsSameDate, allCourtsSameTime, allCourtsSameLocation, allCourtsDifferentScheduleOptions: Bool?
    let globalPlayerConfirmationCounts: GlobalPlayerConfirmationCounts?
    let showGlobalPlayerConfirmationCounts: Bool?
    let scoresLastEnteredByName, scoresLastEnteredByPlayerID, scoresAcceptedByName, scoresAcceptedByPlayerID: String?
    let scoreStatus: String?
    let userPermissions: [String: UserPermission]?
    let notesForEvent: String?
    let missingPlayersCount: Int?
    let discardedAt, opponentTeamType, globalPlayerChatRoom, opponentTeamName: String?
    let assignType: String?
    let allowParticipantsManagePlayers: Bool?
    let playerPool: String?
    let playersLimit, rsvpLimit: Int?
    let playerAcceptanceType: String?
    let playerPoolGender, playerPoolAgeLimitType, playerPoolMinAge, playerPoolMaxAge: String?
    let playerPoolNotes: String?
    let withCoach, withAudience: Bool?
    let attendanceDeadlineUnit: Int?
    let attendanceDeadlineUnitType: String?
    let homeTeamNotDecided: Bool?
    let currentUserEventDetails: [CurrentUserEventDetail]?
    let eventCourts: [EventCourt]?
    let eventTeams: [String]?
    let eventCoaches: [EventCoach]?
    let eventAudiences: [String]?
    let eventInvitees: [EventInvitee]?
    let captainsChatRoom: String?

    enum CodingKeys: String, CodingKey {
        case id
        case eventPlanType = "event_plan_type"
        case eventType = "event_type"
        case rescheduled
        case firstStartTime = "first_start_time"
        case lastEndTime = "last_end_time"
        case rescheduledAt = "rescheduled_at"
        case createdBy = "created_by"
        case status
        case originatorID = "originator_id"
        case originatorType = "originator_type"
        case allCourtsSameDate = "all_courts_same_date"
        case allCourtsSameTime = "all_courts_same_time"
        case allCourtsSameLocation = "all_courts_same_location"
        case allCourtsDifferentScheduleOptions = "all_courts_different_schedule_options"
        case globalPlayerConfirmationCounts = "global_player_confirmation_counts"
        case showGlobalPlayerConfirmationCounts = "show_global_player_confirmation_counts"
        case scoresLastEnteredByName = "scores_last_entered_by_name"
        case scoresLastEnteredByPlayerID = "scores_last_entered_by_player_id"
        case scoresAcceptedByName = "scores_accepted_by_name"
        case scoresAcceptedByPlayerID = "scores_accepted_by_player_id"
        case scoreStatus = "score_status"
        case userPermissions = "user_permissions"
        case notesForEvent = "notes_for_event"
        case missingPlayersCount = "missing_players_count"
        case discardedAt = "discarded_at"
        case opponentTeamType = "opponent_team_type"
        case globalPlayerChatRoom = "global_player_chat_room"
        case opponentTeamName = "opponent_team_name"
        case assignType = "assign_type"
        case allowParticipantsManagePlayers = "allow_participants_manage_players"
        case playerPool = "player_pool"
        case playersLimit = "players_limit"
        case rsvpLimit = "rsvp_limit"
        case playerAcceptanceType = "player_acceptance_type"
        case playerPoolGender = "player_pool_gender"
        case playerPoolAgeLimitType = "player_pool_age_limit_type"
        case playerPoolMinAge = "player_pool_min_age"
        case playerPoolMaxAge = "player_pool_max_age"
        case playerPoolNotes = "player_pool_notes"
        case withCoach = "with_coach"
        case withAudience = "with_audience"
        case attendanceDeadlineUnit = "attendance_deadline_unit"
        case attendanceDeadlineUnitType = "attendance_deadline_unit_type"
        case homeTeamNotDecided = "home_team_not_decided"
        case currentUserEventDetails = "current_user_event_details"
        case eventCourts = "event_courts"
        case eventTeams = "event_teams"
        case eventCoaches = "event_coaches"
        case eventAudiences = "event_audiences"
        case eventInvitees = "event_invitees"
        case captainsChatRoom = "captains_chat_room"
    }
}

// MARK: - CurrentUserEventDetail
struct CurrentUserEventDetail: Codable {
    let isPlayer: Bool?
    let isCoach: String?
    let isManager: Bool?
    let teamID: String?
    let eventPlayerID: Int?
    let user: User?
    let opponentTeamName: String?

    enum CodingKeys: String, CodingKey {
        case isPlayer = "is_player"
        case isCoach = "is_coach"
        case isManager = "is_manager"
        case teamID = "team_id"
        case eventPlayerID = "event_player_id"
        case user
        case opponentTeamName = "opponent_team_name"
    }
}

// MARK: - User
struct User: Codable {
    let id: Int?
    let firstName, lastName: String?
    let avatarFileAttachmentURL, thumbnailAttachmentURL: String?

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatarFileAttachmentURL = "avatar_file_attachment_url"
        case thumbnailAttachmentURL = "thumbnail_attachment_url"
    }
}

// MARK: - EventCoach
struct EventCoach: Codable {
    let id: Int?
    let role: String?
    let position, teamID, courtSideID, isPlayer: String?
    let isCoach: Bool?
    let user: User?

    enum CodingKeys: String, CodingKey {
        case id, role, position
        case teamID = "team_id"
        case courtSideID = "court_side_id"
        case isPlayer = "is_player"
        case isCoach = "is_coach"
        case user
    }
}

// MARK: - EventCourt
struct EventCourt: Codable {
    let id: Int?
    let matchType, startTime, endTime: String?
    let rescheduledAt: String?
    let order: Int?
    let notesForCourt, courtShortName, courtFullName: String?
    let cancelledAt: String?
    let userPermissions: UserPermissions?
    let previousStartTime, previousEndTime, status: String?
    let place, previousPlace: String?
    let courtSides: [CourtSide]?
    let eventCourtScheduleOptions: [EventCourtScheduleOption]?

    enum CodingKeys: String, CodingKey {
        case id
        case matchType = "match_type"
        case startTime = "start_time"
        case endTime = "end_time"
        case rescheduledAt = "rescheduled_at"
        case order
        case notesForCourt = "notes_for_court"
        case courtShortName = "court_short_name"
        case courtFullName = "court_full_name"
        case cancelledAt = "cancelled_at"
        case userPermissions = "user_permissions"
        case previousStartTime = "previous_start_time"
        case previousEndTime = "previous_end_time"
        case status, place
        case previousPlace = "previous_place"
        case courtSides = "court_sides"
        case eventCourtScheduleOptions = "event_court_schedule_options"
    }
}

// MARK: - CourtSide
struct CourtSide: Codable {
    let id: Int?
    let side: String?
    let playOutcome: String?
    let courtNumber: Int?
    let teamID: String?
    let courtShortName, courtFullName: String?
    let eventCourtPlayers: [EventCourtPlayer]?
    let eventScores: [String]?

    enum CodingKeys: String, CodingKey {
        case id, side
        case playOutcome = "play_outcome"
        case courtNumber = "court_number"
        case teamID = "team_id"
        case courtShortName = "court_short_name"
        case courtFullName = "court_full_name"
        case eventCourtPlayers = "event_court_players"
        case eventScores = "event_scores"
    }
}

// MARK: - EventCourtPlayer
struct EventCourtPlayer: Codable {
    let id, eventCourtID, courtSideID: Int?
    let position: String?
    let user: User?

    enum CodingKeys: String, CodingKey {
        case id
        case eventCourtID = "event_court_id"
        case courtSideID = "court_side_id"
        case position, user
    }
}

// MARK: - EventCourtScheduleOption
struct EventCourtScheduleOption: Codable {
    let id: Int?
    let startTime: String?
    let duration: Int?
    let place: Place?

    enum CodingKeys: String, CodingKey {
        case id
        case startTime = "start_time"
        case duration, place
    }
}

// MARK: - Place
struct Place: Codable {
    let id: Int?
    let name, address, contactNumber, website: String?
    let distance: String?
    let placeType: String?
    let addressDetail: AddressDetail?

    enum CodingKeys: String, CodingKey {
        case id, name, address
        case contactNumber = "contact_number"
        case website, distance
        case placeType = "place_type"
        case addressDetail = "address_detail"
    }
}

// MARK: - AddressDetail
struct AddressDetail: Codable {
    let id: Int?
    let deliveryLine1: String?
    let lastLine: String?
    let cityName: String?
    let plus4Code, primaryNumber: String?
    let stateAbbreviation: String?
    let streetName, streetSuffix, zipcode, congressionalDistrict: String?
    let countyFIPS: String?
    let countyName, latitude, longitude: String?
    let active: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case deliveryLine1 = "delivery_line_1"
        case lastLine = "last_line"
        case cityName = "city_name"
        case plus4Code = "plus4_code"
        case primaryNumber = "primary_number"
        case stateAbbreviation = "state_abbreviation"
        case streetName = "street_name"
        case streetSuffix = "street_suffix"
        case zipcode
        case congressionalDistrict = "congressional_district"
        case countyFIPS = "county_fips"
        case countyName = "county_name"
        case latitude, longitude, active
    }
}

// MARK: - UserPermissions
struct UserPermissions: Codable {
    let eventCourtCancel, eventCourtUndoCancel, eventCourtDestroy: UserPermission?

    enum CodingKeys: String, CodingKey {
        case eventCourtCancel = "event_court.cancel"
        case eventCourtUndoCancel = "event_court.undo_cancel"
        case eventCourtDestroy = "event_court.destroy"
    }
}

// MARK: - UserPermission
struct UserPermission: Codable {
    let access: Access?
}

enum Access: String, Codable {
    case upEnabled = "up_enabled"
    case upNotAvailable = "up_not_available"
}

// MARK: - EventInvitee
struct EventInvitee: Codable {
    let id, eventID: Int?
    let user: User?

    enum CodingKeys: String, CodingKey {
        case id
        case eventID = "event_id"
        case user
    }
}

// MARK: - GlobalPlayerConfirmationCounts
struct GlobalPlayerConfirmationCounts: Codable {
}
