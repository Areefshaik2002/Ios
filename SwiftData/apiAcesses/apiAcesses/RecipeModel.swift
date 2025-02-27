//
//  Model.swift
//  apiAcesses
//
//  Created by Shaik Areef on 19/02/25.

import Foundation

struct RecipeResponse: Codable {
    let meals: [Recipe]?
}

struct Recipe: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strInstructions: String
    let strMealThumb: String
    
    var id: String {
        idMeal
    }
}
