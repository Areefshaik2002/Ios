//
//  NewUserCreationModel.swift
//  NewUserCreation
//
//  Created by Shaik Areef on 24/02/25.

import Foundation


struct UserModel: Codable {
    let user: User?
}

struct User: Codable {
    let id: Int?
    let firstName, lastName: String?
    let email: String?
    let mobileNumber: String?
    let avatarFileAttachmentURL, thumbnailAttachmentURL: String?
    let roles: [String]?
    let active: Bool?
    let confirmedAt: String?
    let distanceType, uid: String?
    let consentForTextMessages: Bool?
    let uuid: String?
    let countryID: Int?
    let isSignedUp: Bool?
    let parentUserID, timezoneIdentifier, supportChatRoomURL: String?
    let children: [String]?
    let country: Country?
    let places: [String]?
    let parent: String?

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case mobileNumber = "mobile_number"
        case avatarFileAttachmentURL = "avatar_file_attachment_url"
        case thumbnailAttachmentURL = "thumbnail_attachment_url"
        case roles, active
        case confirmedAt = "confirmed_at"
        case distanceType = "distance_type"
        case uid
        case consentForTextMessages = "consent_for_text_messages"
        case uuid
        case countryID = "country_id"
        case isSignedUp = "is_signed_up"
        case parentUserID = "parent_user_id"
        case timezoneIdentifier = "timezone_identifier"
        case supportChatRoomURL = "support_chat_room_url"
        case children, country, places, parent
    }
}

struct Country: Codable {
    let id: Int?
    let name, code: String?
    let displayOrder: Int?
    let regionCode, distanceType: String?

    enum CodingKeys: String, CodingKey {
        case id, name, code
        case displayOrder = "display_order"
        case regionCode = "region_code"
        case distanceType = "distance_type"
    }
}
