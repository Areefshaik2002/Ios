//
//  apiAcessesApp.swift
//  apiAcesses
//
//  Created by Shaik Areef on 19/02/25.
//

import Foundation
import Moya

@Observable class RecipeViewModel{
    var recipes: [Recipe] = []
    private let provider = MoyaProvider<RecipeService>()

    func searchRecipe(recipeName: String) {
        provider.request(.searchRecipe(recipeName: recipeName)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedResponse = try JSONDecoder().decode(RecipeResponse.self, from: response.data)
                    DispatchQueue.main.async {
                        self.recipes = decodedResponse.meals ?? []
                    }
                } catch {
                    print("Failed to decode JSON: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
