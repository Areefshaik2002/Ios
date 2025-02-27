//
//  InstructionView.swift
//  apiAcesses
//
//  Created by Shaik Areef on 26/02/25.
//

import SwiftUI

struct InstructionView: View {
    var recipe: Recipe

    var body: some View {
        VStack {
            Text(recipe.strMeal)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Text("Category: \(recipe.strCategory)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding()

            Text(recipe.strInstructions)
                .padding()
                .font(.body)
                .lineLimit(nil) 
            Spacer()
        }
        .navigationTitle("Recipe Instructions")
    }
}

