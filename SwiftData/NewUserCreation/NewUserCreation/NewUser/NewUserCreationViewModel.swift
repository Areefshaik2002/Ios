//
//  NewUserCreationViewModel.swift
//  NewUserCreation
//
//  Created by Shaik Areef on 24/02/25.
//

import Foundation
import Moya

@Observable
class NewUserCreationViewModel {
    private let provider = MoyaProvider<UsersAPI>()
    var usermodel: UserModel?
    
    private func createUser(mobileNumber: String, firstName: String, lastName:String,/* roles: [String],*/ countryId: Int, regionCode: String ) async throws {
        provider.request(.addUser(
            mobileNumber: mobileNumber,
            firstName: firstName,
            lastName: lastName,
//            roles: roles,
            countryId: countryId,
            regionCode: regionCode, token: try await fetchToken()
        )) { result in
            switch result {
            case .success(let response):
                if let jsonString = String(data: response.data, encoding: .utf8) {
                    print("Response: \(jsonString)")
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func fetchToken() async throws -> String {
        print("verifying")
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
    
    private func fetchVerificationCode() async throws -> String {
        print("sending verification code")
        let response = try await provider.request(.verificationCode)

        let json = try JSONSerialization.jsonObject(with: response.data) as? [String: Any]
        guard let code = json?["verification_code"] as? String else {
            throw URLError(.cannotParseResponse)
        }
        print("returning code")
        return code
    }
}

    
    
//    func createUser() async throws {
//        provider.request(.addUser(
//            mobileNumber: "8790663842",
//            firstName: "vikram",
//            lastName: "World",
//            roles: ["ur_player"],
//            countryId: 80,
//            regionCode: "IN", token: try await fetchToken()
//        )) { result in
//            switch result {
//            case .success(let response):
//                if let jsonString = String(data: response.data, encoding: .utf8) {
//                    print("Response: \(jsonString)")
//                }
//            case .failure(let error):
//                print("Error: \(error.localizedDescription)")
//            }
//        }
//    }
    
//    func addUserDetails(mobileNumber: String, firstName: String, lastName: String, roles: [String], countryId: Int, regionCode: String) async {
//        do {
//            let data = try await addUser(mobileNumber: mobileNumber, firstName: firstName, lastName: lastName, roles: roles, countryId: countryId, regionCode: regionCode)
//            usermodel = data
//            print("User successfully created")
//        } catch {
//            print("Error creating user: \(error.localizedDescription)")
//        }
//    }
//    
//
//    private func addUser(mobileNumber: String, firstName: String, lastName: String, roles: [String], countryId: Int, regionCode: String) async throws -> UserModel? {
//        let token = try await fetchToken()
//        
//        let response = try await provider.request(.addUser(
//            mobileNumber: mobileNumber,
//            firstName: firstName,
//            lastName: lastName,
//            roles: roles,
//            countryId: countryId,
//            regionCode: regionCode,
//            token: token
//        ))
//        
//        guard response.statusCode == 200 else {
//            throw URLError(.badServerResponse)
//        }
//        
//        do {
//            let decoder = JSONDecoder()
//            let newUser = try decoder.decode(UserModel.self, from: response.data)
//            return newUser
//        } catch {
//            print("Error decoding user response: \(error)")
//            throw error
//        }
//    }
    
//import Foundation
//import Moya
//
//@Observable
//class NewUserCreationViewModel {
//    private let provider = MoyaProvider<UsersAPI>()
//    var user: UserModel?
//    
//    func addUserDetails(mobileNumber: String, firstName: String, lastName: String, roles: [String], countryId: Int, regionCode: String) async {
//        do {
//            let data = try await addUser(mobileNumber: mobileNumber, firstName: firstName, lastName: lastName, roles: roles, countryId: countryId, regionCode: regionCode)
//            user = data
//            print("User successfully created")
//        } catch {
//            print("Error creating user: \(error.localizedDescription)")
//        }
//    }
//    
//    private func addUser(mobileNumber: String, firstName: String, lastName: String, roles: [String], countryId: Int, regionCode: String) async throws -> UserModel? {
//        let token = try await fetchToken(mobileNumber: mobileNumber)
//        
//        let response = try await provider.request(.addUser(
//            mobileNumber: mobileNumber,
//            firstName: firstName,
//            lastName: lastName,
//            roles: roles,
//            countryId: countryId,
//            regionCode: regionCode,
//            token: token
//        ))
//        
//        guard response.statusCode == 200 else {
//            print("bad response")
//            throw URLError(.badServerResponse)
//        }
//        
//        do {
//            let decoder = JSONDecoder()
//            let newUser = try decoder.decode(UserModel.self, from: response.data)
//            print("new user created")
//            return newUser
//        } catch {
//            print("Error decoding user response: \(error)")
//            throw error
//        }
//    }
//    
//    private func fetchToken(mobileNumber: String) async throws -> String {
//        let verificationCode = try await fetchVerificationCode(mobileNumber: mobileNumber)
//
//        let response = try await provider.request(.token(
//            verificationCode: verificationCode,
//            mobileNumber: mobileNumber
//        ))
//
//        let decoder = JSONDecoder()
//        let tokenResponse = try decoder.decode(TokenResponse.self, from: response.data)
//        
//        guard let token = tokenResponse.access_token else {
//            throw URLError(.cannotParseResponse)
//        }
//
//        print("Access token received")
//        return token
//    }
//    
//    private func fetchVerificationCode(mobileNumber: String) async throws -> String {
//        let response = try await provider.request(.verificationCode(
//            mobileNumber: mobileNumber,
//            countryCode: 91,
//            regionCode: "IN"
//        ))
//
//        let decoder = JSONDecoder()
//        let verificationResponse = try decoder.decode(VerificationResponse.self, from: response.data)
//        
//        guard let code = verificationResponse.verification_code else {
//            throw URLError(.cannotParseResponse)
//        }
//        
//        print("Verification code received")
//        return code
//    }
//}
//
//struct VerificationResponse: Decodable {
//    let verification_code: String?
//}
//
//struct TokenResponse: Decodable {
//    let access_token: String?
//}
//



//import Foundation
//import Moya
//
//@Observable
//class NewUserCreationViewModel {
//    private let provider = MoyaProvider<UsersAPI>()
//    var user: UserModel?
//    
//    func addUserDetails(mobileNumber: String, firstName: String, lastName: String, roles: [String], countryId: Int, regionCode: String) async {
//        do {
//            let data = try await addUser(mobileNumber: mobileNumber, firstName: firstName, lastName: lastName, roles: roles, countryId: countryId, regionCode: regionCode)
//            user = data
//            print("User successfully created")
//        } catch {
//            print("Error creating user: \(error.localizedDescription)")
//        }
//    }
//    
//    private func addUser(mobileNumber: String, firstName: String, lastName: String, roles: [String], countryId: Int, regionCode: String) async throws -> UserModel? {
//        let token = try await fetchToken(mobileNumber: mobileNumber)
//        
//        let response = try await provider.request(.addUser(
//            mobileNumber: mobileNumber,
//            firstName: firstName,
//            lastName: lastName,
//            roles: roles,
//            countryId: countryId,
//            regionCode: regionCode,
//            token: token
//        ))
//        
//        guard response.statusCode == 200 else {
//            throw URLError(.badServerResponse)
//        }
//        
//        do {
//            let decoder = JSONDecoder()
//            let newUser = try decoder.decode(UserModel.self, from: response.data)
//            return newUser
//        } catch {
//            print("Error decoding user response: \(error)")
//            throw error
//        }
//    }
//    
//    private func fetchVerificationCode(mobileNumber: String) async throws -> String {
//        let response = try await provider.request(.verificationCode(
//            mobileNumber: mobileNumber,
//            countryCode: 91,
//            regionCode: "IN"
//        ))
//
//        let decoder = JSONDecoder()
//        let verificationResponse = try decoder.decode(VerificationResponse.self, from: response.data)
//        
//        guard let code = verificationResponse.verification_code else {
//            throw URLError(.cannotParseResponse)
//        }
//        
//        print("Verification code received")
//        return code
//    }
//
//    private func fetchToken(mobileNumber: String) async throws -> String {
//        let verificationCode = try await fetchVerificationCode(mobileNumber: mobileNumber)
//
//        let response = try await provider.request(.token(
//            verificationCode: verificationCode,
//            mobileNumber: mobileNumber
//        ))
//
//        let decoder = JSONDecoder()
//        let tokenResponse = try decoder.decode(TokenResponse.self, from: response.data)
//        
//        guard let token = tokenResponse.access_token else {
//            throw URLError(.cannotParseResponse)
//        }
//
//        print("Access token received")
//        return token
//    }
//}
//
//struct VerificationResponse: Decodable {
//    let verification_code: String?
//}
//
//struct TokenResponse: Decodable {
//    let access_token: String?
//}
