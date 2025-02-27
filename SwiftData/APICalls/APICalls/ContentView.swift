//
//  ContentView.swift
//  APICalls
//
//  Created by Shaik Areef on 18/02/25.
//
import SwiftUI

struct ContentView: View {
    var viewModel : GHViewModel
    @State var search: String = ""

    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 16){
                TextField("Search username", text: $search)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .border(.gray, width: 1)
                Button("Search") {
                    viewModel.getDetailsOfUser(userName: search)
                }
                .padding()
                if let user = viewModel.user { 
                    VStack {
                        AsyncImage(url: URL(string: user.avatarUrl ?? "")) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 200, height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        Text(user.login ?? "")
                            .font(.headline)
                        Text(user.bio ?? "")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        NavigationLink(destination: MoreDetailsOfUser(viewModel: GHViewModel(), user: user)) {
                            Text("See More details")
                                .underline()
                                .foregroundColor(.blue)
                        }
                    }
                } else {
                    Text("No user found. Please search.")
                }

                
            }
        }
    }
}






//        .task {
//            do{
//                userDetails = try await getDetails()
//            }catch GHError.decodingError{
//                print("error while getting data")
//            }catch GHError.invalidResponse{
//                print("error occured with response")
//            }catch GHError.internalServerError{
//                print("server issue occured")
//            }catch{
//                print("Unknown error")
//            }
//        }
//    }

//    func getDetails() async throws -> GHModel{
//        let endPoint = "https://api.github.com/users/Areefshaik2002"
//        guard let url = URL(string: endPoint) else{
//            throw GHError.decodingError
//        }
//        let (data, response) = try await URLSession.shared.data(from: url)
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            throw GHError.invalidResponse
//        }
//        do{
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            return try decoder.decode(GHModel.self, from: data)
//        }catch{
//            print("unable to retrive data")
//            throw GHError.decodingError
//        }
//    }
//
//}

//enum GHError: Error {
//    case networkError
//    case decodingError
//    case invalidResponse
//    case internalServerError
//}

