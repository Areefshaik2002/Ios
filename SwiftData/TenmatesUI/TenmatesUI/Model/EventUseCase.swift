//
//  EventUseCase.swift
//  TenmatesUI
//
//  Created by Shaik Areef on 20/02/25.
//
import Foundation

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


func fetchEventDetails(eventID: String) async throws -> Welcome {
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

