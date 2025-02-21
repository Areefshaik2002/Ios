import Foundation

//var token = ""

func fetchVerificationCode() async throws -> String {
    guard let url = URL(string: "https://api-stage.tenmates.app/verifications/verify_sms_code?code=123456&country_code=91&mobile_number=8300004515&region_code=IN") else {
        throw URLError(.badURL)
    }
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    
    let (data, response) = try await URLSession.shared.data(for: request)
    
    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
    if let code = json?["verification_code"] as? String {
        return code
    } else {
        throw URLError(.cannotParseResponse)
    }
}

func getToken() async throws -> String {
    guard let url = URL(string: "https://api-stage.tenmates.app/oauth/token") else {
        throw URLError(.badURL)
    }

    let client_id = "gYanhpa87VxQqkJ-7J8fOy5ehRLvkdat6uWbtjpFUtQ"
    let client_secret = "Wj9wd0jWkCVEPt2hKk3IK2QjUOy3fTMFzzykxRH0PDU"
    let username = "8300004515"
    let verificationCode = try await fetchVerificationCode()
    let grant_type = "password"

    let body = "client_id=\(client_id)&client_secret=\(client_secret)&username=\(username)&verification_code=\(verificationCode)&grant_type=\(grant_type)"
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    request.httpBody = body.data(using: .utf8)
    
    let (data, response) = try await URLSession.shared.data(for: request)
    
    if let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [String: Any],
       let accessToken = jsonResponse["access_token"] as? String {
        return accessToken
    }
    else {
        throw URLError(.cannotParseResponse)
    }
}

//Task {
//    do {
//        token = try await getToken()
//        print(token)
//    } catch {
//        error.localizedDescription
//    }
//}




