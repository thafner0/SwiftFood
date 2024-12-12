//
//  IngredientDetail.swift
//  SwiftFood
//
//  Created by Trevor Hafner on 12/12/2024.
//

import SwiftUI

struct IngredientDetail: View {
    @Bindable var ingredient: MyIngredient
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $ingredient.title)
                TextField("Amount", value: $ingredient.amount, format: .number)
                TextField("Unit", text: $ingredient.unit)
            }
                .navigationTitle("Ingredient Detail")
        }
    }
}

#Preview {
    @Previewable @State var selectedIngredient: MyIngredient?
    let ingredients = [MyIngredient(title: "Lemon", amount: 1, unit: "count")]
    
    NavigationStack {
        List(ingredients, selection: $selectedIngredient) { ingredient in
            VStack(alignment: .leading) {
                Text(ingredient.title)
                Text("\(ingredient.amount) \(ingredient.unit) available")
                    .font(.footnote)
            }
            .tag(ingredient)
        }
        .sheet(item: $selectedIngredient, content: { ingredient in
            IngredientDetail(ingredient: ingredient)
        })
        .navigationTitle("Ingredients")
    }
}
