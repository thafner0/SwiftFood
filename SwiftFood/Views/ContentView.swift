//
//  ContentView.swift
//  SwiftFood
//
//  Created by Matthew Caballero on 12/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("kitchen")
                    .resizable()
                    .scaledToFit() // Maintains aspect ratio
                    .frame(width: 300) // Limits the width to 300

                Text("My Little Kitchen.")
                    .font(.largeTitle)
                    .padding()
                NavigationLink("View your ingredients!") {
                    MyIngredientList()
                }
                .accessibilityIdentifier("ToIngredients")
                .buttonStyle(.borderedProminent)
                .padding(.bottom)
                NavigationLink("View your recipes!") {
                    RecipeList()
                }
                .accessibilityIdentifier("ToRecipes")
                .buttonStyle(.borderedProminent)
                .padding(.bottom)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

