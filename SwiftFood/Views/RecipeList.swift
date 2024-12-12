//
//  RecipeList.swift
//  SwiftFood
//
//  Created by Matthew Caballero on 12/11/24.
//

import SwiftUI
import SwiftData

struct RecipeList: View {
    @Environment(\.modelContext) private var context
    @Query private var myRecipes: [Recipe]
    
    var body: some View {
        VStack {
            Text("Recipes")
                .font(.title2)
                .fontWeight(.bold)
            
            List {
                // For each recipe in recipes context
                ForEach(myRecipes) { recipe in
                    NavigationLink {
                        RecipeDetail(recipe: recipe)
                    } label: {
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text(recipe.title)
                                    .font(.headline)
                                // Formatting to show the decimal correctly
                                Text("\(String(format: "%.1f", recipe.time_required)) hours")
                                Text("\(recipe.servings_amount) servings")
                            }
                            Spacer()
                            
                            // Delete Button
                            Button(action: {
                                deleteItem(recipe)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }
  
            }
            .cornerRadius(20)
            NavigationLink("Create New Recipe") {
                RecipeCreate()
            }
            .accessibilityIdentifier("ToRecipeCreate")
            .buttonStyle(.borderedProminent)
            .padding(.bottom)
        }
        .padding()
    }
    
    func deleteItem(_ recipe: Recipe) {
        context.delete(recipe)
    }
}

#Preview {
    RecipeList()
}
