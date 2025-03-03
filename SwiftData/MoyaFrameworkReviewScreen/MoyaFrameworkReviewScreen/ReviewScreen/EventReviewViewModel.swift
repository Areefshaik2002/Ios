//
//  EventReviewViewModel.swift
//  MoyaFrameworkReviewScreen
//
//  Created by Shaik Areef on 28/02/25.
//

import Foundation
import Moya
import SwiftUI

@Observable class EventReviewViewModel {
     var events: Welcome?
     var isLoading: Bool = false
     var errorMessage: String?

    let provider = MoyaProvider<EventReviewUseCase>()

    func fetchVerificationCode(completion: @escaping (Result<String, Error>) -> Void) {
        provider.request(.getVerificationCode(
            mobileNumber: 8300004515,
            countryCode: 91,
            regionCode: "IN"
        )) { result in
            switch result {
            case .success(let response):
                do {
                    let json = try JSONSerialization.jsonObject(with: response.data, options: []) as? [String: Any]
                    if let code = json?["verification_code"] as? String {
                        completion(.success(code))
                    } else {
                        completion(.failure(URLError(.cannotParseResponse)))
                    }
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetchToken(completion: @escaping (Result<String, Error>) -> Void) {
        fetchVerificationCode { result in
            switch result {
            case .success(let verificationCode):
                self.provider.request(.getToken(
                    username: "8300004515",
                    verification_code: verificationCode
                )) { result in
                    switch result {
                    case .success(let response):
                        do {
                            let json = try JSONSerialization.jsonObject(with: response.data, options: []) as? [String: Any]
                            if let token = json?["access_token"] as? String {
                                completion(.success(token))
                            } else {
                                completion(.failure(URLError(.cannotParseResponse)))
                            }
                        } catch {
                            completion(.failure(error))
                        }
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func getData(eventId: Int, accessToken: String) {
        self.isLoading = true
        provider.request(.getData(eventId: eventId)) { result in
            DispatchQueue.main.async {
                self.isLoading = false
            }
            switch result {
            case .success(let response):
                if response.statusCode == 200 {
                    do {
                        let decodedResponse = try JSONDecoder().decode(Welcome.self, from: response.data)
                        DispatchQueue.main.async {
                            self.events = decodedResponse
                        }
                    } catch {
                        DispatchQueue.main.async {
                            self.errorMessage = "Error decoding response: \(error)"
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.errorMessage = "Error: Status Code \(response.statusCode)"
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = "Request failed with error: \(error.localizedDescription)"
                }
            }
        }
    }
}
    





