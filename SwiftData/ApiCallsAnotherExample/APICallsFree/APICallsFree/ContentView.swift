//
//  ContentView.swift
//  APICalls
//
//  Created by Shaik Areef on 18/02/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var recipeDetails: [GHModel]?
    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: URL(string: recipeDetails?[0].strMealThumb ?? "")){ image in
                
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                
            }placeholder: {
                Circle()
                    .foregroundColor(.secondary)
                    .frame(width: 120, height: 120)
            }
            Text(recipeDetails?[0].strArea ?? "Area placeholder")
                .bold()
                .font(.title)
            Text(recipeDetails?[0].strCategory ?? "category placeholder")
                .font(.title3)
                .padding()
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding()
        .task {
            do{
                recipeDetails = try await getDetails()
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
    
    func getDetails() async throws -> [GHModel]{
        let endPoint = "https://www.themealdb.com/api/json/v1/1/search.php?s=chicken"
        guard let url = URL(string: endPoint) else{
            throw GHError.decodingError
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GHError.invalidResponse
        }
        do{
            let decoder = JSONDecoder()
            let recipeData = try decoder.decode(Response.self, from: data)
            return recipeData.meals
        }catch{
            print("unable to retrive data")
            throw GHError.decodingError
        }
    }
    
}
struct Response: Codable {
    let meals: [GHModel]
}

struct GHModel: Codable {
    let strMealThumb: String
    let strCategory: String
    let strArea: String
}

enum GHError: Error {
    case networkError
    case decodingError
    case invalidResponse
    case internalServerError
}

