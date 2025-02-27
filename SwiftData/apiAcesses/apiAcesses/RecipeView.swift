//
//  ContentView.swift
//  apiAcesses
//
//  Created by Shaik Areef on 19/02/25.
//

import SwiftUI

struct RecipeView: View {
    var viewModel = RecipeViewModel()
    @State var searchText = ""

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter recipe name...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Search") {
                    viewModel.searchRecipe(recipeName: searchText)
                }
                .padding()

                List(viewModel.recipes) { recipe in
                    HStack {
                        AsyncImage(url: URL(string: recipe.strMealThumb)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        VStack(alignment: .leading) {
                            Text(recipe.strMeal)
                                .font(.headline)
                            Text(recipe.strCategory)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            NavigationLink(destination: InstructionView(recipe: recipe)) {
                                Text("See instructions")
                                    .underline()
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Recipe Search")
        }
    }
}
