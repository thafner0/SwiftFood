//
//  IngredientRow.swift
//  SwiftFood
//
//  Created by Trevor Hafner on 12/12/2024.
//

import SwiftUI
import SwiftData

struct IngredientRow: View {
    let ingredient: MyIngredient
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(ingredient.title)
            Text("\(ingredient.amount) \(ingredient.unit) available")
                .font(.footnote)
        }
    }
}

#Preview {
    let ingredients: [MyIngredient] = [MyIngredient(title: "Lemon", amount: 500, unit: "count")]
    NavigationStack {
        List(ingredients) { ingredient in
            IngredientRow(ingredient: ingredient)
        }
        .navigationTitle("Ingredients")
    }
    .modelContainer(previewContainer)
}
