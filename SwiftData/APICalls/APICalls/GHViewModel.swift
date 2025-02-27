//
//  GHViewModel.swift
//  APICalls
//
//  Created by Shaik Areef on 26/02/25.
//

import Foundation
import Moya

@Observable class GHViewModel {
    var user: GitHubUser?
    let provider = MoyaProvider<GHService>()
    
    func getDetailsOfUser(userName: String) {
        provider.request(.getDetailsOfUser(user: userName)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedResponse = try JSONDecoder().decode(GitHubUser.self, from: response.data)
                    DispatchQueue.main.async {
                        self.user = decodedResponse 
                    }
                } catch {
                    print("Error decoding response: \(error)")
                }
            case .failure(let error):
                print("Request failed: \(error)")
            }
        }
    }
    
    func originalDate(from dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter.date(from: dateString)
    }
    
    func fullDate(from dateString: String) -> String {
        guard let date = originalDate(from: dateString) else { return "Unknown" }
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMMM yyyy"
        return formatter.string(from: date)
    }

}

//import Foundation
//import Moya
//
//@Observable class GHViewModel {
//    var users: [GHModel] = []
//    let provider = MoyaProvider<GHService>()
//    
//    func getDetailsOfUser(userName: String) {
//        provider.request(.getDetailsOfUser(user: userName)) { result in
//            switch result {
//            case .success(let response):
//                do {
//                    let decodedResponse = try JSONDecoder().decode(GHModel.self, from: response.data)
//                    DispatchQueue.main.async {
//                        // Assuming you want to display a single user detail
//                        self.users = [decodedResponse] // Updated to store a single user instead of an array
//                    }
//                } catch {
//                    print("Error decoding response: \(error)")
//                }
//            case .failure(let error):
//                print("Request failed: \(error)")
//            }
//        }
//    }
//}
//
