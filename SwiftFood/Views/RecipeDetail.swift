//
//  RecipeDetail.swift
//  SwiftFood
//
//  Created by Matthew Caballero on 12/11/24.
//

import SwiftUI

struct RecipeDetail: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            Image("food")
                .resizable()
                .scaledToFit()
                .frame(width: 250)
            VStack {
                Text(recipe.title)
                    .font(.largeTitle)
                    .padding()
                Text("Time required: \(String(format: "%.1f", recipe.time_required)) hours")
                Text("Serving count: \(recipe.servings_amount) servings")
                
                Text("Instructions:")
                    .font(.title)
                    .padding()
                Text(recipe.instructions)
            }
        }
    }
}
