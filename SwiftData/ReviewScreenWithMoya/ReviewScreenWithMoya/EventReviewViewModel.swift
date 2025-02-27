//
//  EventReviewViewModel.swift
//  ReviewScreenWithMoya
//
//  Created by Shaik Areef on 26/02/25.
//

import Foundation
import Moya
import SwiftUI

var appColor = Color.init(red: 193/255, green: 215/255, blue: 46/255)
let appColorGradient = LinearGradient(colors: [Color(appColor).opacity(0.5), .black, Color(appColor).opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)

@Observable class EventReviewViewModel {
    var events: Welcome?
    let provider = MoyaProvider<EventReviewUseCase>()
    func getData(eventId: Int) {
        provider.request(.getData(eventId: eventId)) { result in
            switch result {
            case .success(let response):
                if response.statusCode == 200 {
                    do {
                        let decodedResponse = try JSONDecoder().decode(Welcome.self, from: response.data)
                        DispatchQueue.main.async {
                            self.events = decodedResponse
                        }
                        print("Data fetched successfully")
                    } catch {
                        print("Error decoding response: \(error)")
                    }
                } else {
                    print("Error: Status Code \(response.statusCode), \(String(data: response.data, encoding: .utf8) ?? "")")
                }
                
            case .failure(let error):
                print("Request failed with error: \(error.localizedDescription)")
            }
        }
    }

}





















//@Observable class EventReviewViewModel {
//    var event: Event?
//    
//    
//    func getVerified(){
//        let provider = MoyaProvider<EventReviwUseCase>()
//        provider.request(.sendOTP(code: 123456, countryCode: 91, mobileNumber: 8300004515, regionCode: "IN")){ result in
//            switch result{
//            case .success(let response):
//                do{
//                    let jsonResponse = try JSONSerialization.jsonObject(with: response.data, options: [])
//                    print("Success:", jsonResponse)
//                } catch {
//                    print("Failed to parse response:", error.localizedDescription)
//                }
//            case .failure(let error):
//                print("Error: \(error.localizedDescription)")
//            }
//        }
//    }
//    
//    func getAccessToken(){
//        let provider = MoyaProvider<EventReviwUseCase>()
//        provider.request(.getAccessToken(client_id: "gYanhpa87VxQqkJ-7J8fOy5ehRLvkdat6uWbtjpFUtQ", client_secret: "Wj9wd0jWkCVEPt2hKk3IK2QjUOy3fTMFzzykxRH0PDU", username: 8300004515, grant_type: "password", verification_code: "\(getVerified())")){ result in
//            switch result{
//            case .success(let response):
//                do{
//                    let jsonResponse = try JSONSerialization.jsonObject(with: response.data, options: [])
//                    print("Success:", jsonResponse)
//                }catch{
//                    print("Error: \(error.localizedDescription)")
//                }
//            case .failure(let error):
//                print("Error: \(error.localizedDescription)")
//            }
//        }
//    }
//    
//    
//    
//    
//}
