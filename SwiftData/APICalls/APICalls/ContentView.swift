//
//  ContentView.swift
//  APICalls
//
//  Created by Shaik Areef on 18/02/25.
//
import SwiftUI

struct ContentView: View {
    @State private var userDetails: GHModel?
    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: URL(string: userDetails?.avatarUrl ?? "")){ image in
                
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                
            }placeholder: {
                Circle()
                    .foregroundColor(.secondary)
                    .frame(width: 120, height: 120)
            }
            Text(userDetails?.login ?? "login placeholder")
                .bold()
                .font(.title)
            Text(userDetails?.bio ?? "bio placeholder")
                .font(.title3)
                .padding()
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding()
        .task {
            do{
                userDetails = try await getDetails()
            }catch GHError.decodingError{
                print("error while getting data")
            }catch GHError.invalidResponse{
                print("error occured with response")
            }catch GHError.internalServerError{
                print("server issue occured")
            }catch{
                print("Unknown error")
            }
        }
    }
    
    func getDetails() async throws -> GHModel{
        let endPoint = "https://api.github.com/users/Areefshaik2002"
        guard let url = URL(string: endPoint) else{
            throw GHError.decodingError
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GHError.invalidResponse
        }
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GHModel.self, from: data)
        }catch{
            print("unable to retrive data")
            throw GHError.decodingError
        }
    }
    
}

struct GHModel: Decodable {
    let login: String
    let avatarUrl: String
    let bio: String?
}

enum GHError: Error {
    case networkError
    case decodingError
    case invalidResponse
    case internalServerError
}

