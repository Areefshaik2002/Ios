//
//  EventReviewViewModel.swift
//  MoyaFrameworkReviewScreen
//
//  Created by Shaik Areef on 28/02/25.
//

import Foundation
import Moya

@Observable class EventReviewViewModel {
    private let provider = MoyaProvider<eventsAPI>()
    var events: Welcome?
    
    func getEventDetails(eventId:Int) async {
        do {
            let data = try await getDetails(eventId: eventId)
            events = data
            print("data fetched")
        } catch {
            print("Error fetching user details: \(error)")
        }
    }
    
    private func getDetails(eventId:Int) async throws -> Welcome?  {
        let token = try await fetchToken()
        let response = try await provider.request(.getDetails(EventId: eventId, token: token))
        
        guard response.statusCode == 200 else { throw URLError(.badServerResponse) }
            do {
                let decoder = JSONDecoder()
                let mainUser = try decoder.decode(Welcome.self, from: response.data)
                return mainUser
            } catch {
                print("Error decoding response: \(error)")
            }
        return nil
    }
    
    private func fetchVerificationCode() async throws -> String {
        let response = try await provider.request(.verificationCode)

        let json = try JSONSerialization.jsonObject(with: response.data) as? [String: Any]
        guard let code = json?["verification_code"] as? String else {
            throw URLError(.cannotParseResponse)
        }
        return code
    }

    private func fetchToken() async throws -> String {
        let verificationCode = try await fetchVerificationCode()

        let response = try await provider.request(.token(
            verificationCode: verificationCode
        ))

        let json = try JSONSerialization.jsonObject(with: response.data) as? [String: Any]
        guard let token = json?["access_token"] as? String else {
            throw URLError(.cannotParseResponse)
        }
        return token
    }
    
    func dateFormatter(dateString: String, outputTimeZone: TimeZone = TimeZone(abbreviation: "UTC")!) -> String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        guard let date = isoFormatter.date(from: dateString) else {
          print("Failed to parse date from string.")
          return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM hh:mm a"
        formatter.timeZone = outputTimeZone
        return formatter.string(from: date)
      }
}
