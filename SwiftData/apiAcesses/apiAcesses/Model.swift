////
////  Model.swift
////  apiAcesses
////
////  Created by Shaik Areef on 19/02/25.
////
//
//import Foundation
//
//struct APIRequest: Codable {
//    let mobile_number: String
//    let event: Int
//    let team_event: Int
//}
//
//func accessTenmatesAPI() {
//    let url = URL(string: "https://api.tenmates.com/access")!
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST"
//    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//    request.setValue("Bearer YOUR_ACCESS_TOKEN", forHTTPHeaderField: "Authorization")
//
//    let requestBody = APIRequest(mobile_number: "83000004515", event: 3926, team_event: 3984)
//
//    do {
//        request.httpBody = try JSONEncoder().encode(requestBody)
//    } catch {
//        print("Error encoding request: \(error)")
//        return
//    }
//
//    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//        if let error = error {
//            print("Request error: \(error)")
//            return
//        }
//        
//        if let data = data, let responseString = String(data: data, encoding: .utf8) {
//            print("Response: \(responseString)")
//        }
//    }
//
//    task.resume()
//}
