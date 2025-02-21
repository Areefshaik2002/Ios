import Foundation

// Function to get the verification code
func getVerificationCode(completion: @escaping (String?) -> Void) {
    guard let url = URL(string: "https://api-stage.tenmates.app/verifications/verify_sms_code") else {
        print("Invalid URL")
        completion(nil)
        return
    }

    let parameters = [
        "code": "123456",  // The code you are sending
        "country_code": "91",
        "mobile_number": "8300004515",
        "region_code": "IN"
    ]

    let bodyString = parameters.map { "\($0.key)=\($0.value)" }
                               .joined(separator: "&")

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.httpBody = bodyString.data(using: .utf8)

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error: \(error.localizedDescription)")
            DispatchQueue.main.async {
                completion(nil)  // Ensure completion is called on the main thread
            }
            return
        }

        if let httpResponse = response as? HTTPURLResponse {
            print("Response Status Code: \(httpResponse.statusCode)")
        }

        if let data = data {
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                if let jsonResponse = jsonObject as? [String: Any] {
                    if let verificationCode = jsonResponse["verification_code"] as? String {
                        print("Verification Code: \(verificationCode)")
                        DispatchQueue.main.async {
                            completion(verificationCode)  // Ensure completion is called on the main thread
                        }
                    } else {
                        print("Verification code not found in response: \(jsonResponse)")
                        DispatchQueue.main.async {
                            completion(nil)  // Ensure completion is called on the main thread
                        }
                    }
                } else {
                    print("Invalid JSON structure: \(jsonObject)")
                    DispatchQueue.main.async {
                        completion(nil)  // Ensure completion is called on the main thread
                    }
                }
            } catch {
                print("JSON Parsing Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(nil)  // Ensure completion is called on the main thread
                }
            }
        }
    }
    task.resume()
}

// Function to get the access token using the verification code
func getAccessToken(verificationCode: String) {
    guard let url = URL(string: "https://api-stage.tenmates.app/oauth/token") else {
        print("Invalid URL")
        return
    }

    let parameters = [
        "client_id": "gYanhpa87VxQqkJ-7J8fOy5ehRLvkdat6uWbtjpFUtQ",
        "client_secret": "Wj9wd0jWkCVEPt2hKk3IK2QjUOy3fTMFzzykxRH0PDU",
        "username": "8300004515",
        "grant_type": "password",
        "verification_code": verificationCode,
    ]

    let bodyString = parameters.map { "\($0.key)=\($0.value)" }
                               .joined(separator: "&")

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.httpBody = bodyString.data(using: .utf8)

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error: \(error.localizedDescription)")
            return
        }

        if let httpResponse = response as? HTTPURLResponse {
            print("Response Status Code: \(httpResponse.statusCode)")
        }

        if let data = data {
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                if let jsonResponse = jsonObject as? [String: Any] {
                    if let accessToken = jsonResponse["access_token"] as? String {
                        print("Access Token: \(accessToken)")  // Print the access token to the console
                    } else {
                        print("Access token not found in response: \(jsonResponse)")
                    }
                } else {
                    print("Invalid JSON structure: \(jsonObject)")
                }
            } catch {
                print("JSON Parsing Error: \(error.localizedDescription)")
            }
        }
    }
    task.resume()
}

// Call the functions in sequence
getVerificationCode { verificationCode in
    if let code = verificationCode {
        getAccessToken(verificationCode: code)  // Pass the verification code to get the access token
    } else {
        print("Failed to retrieve verification code")
    }
}
