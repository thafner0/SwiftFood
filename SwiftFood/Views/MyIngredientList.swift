//
//  MyIngredientList.swift
//  SwiftFood
//
//  Created by Matthew Caballero on 12/7/24.
//

import SwiftUI
import SwiftData

struct MyIngredientList: View {
    @Environment(\.modelContext) private var context
    @Query private var myIngredients: [MyIngredient]
    
    @State private var title: String = ""
    @State private var amount: Int = 0
    @State private var unit: String = ""
    
    var body: some View {
        List(myIngredients) { ingredient in
            // For each ingredient in myingredient context
            // Gets each ingredient of ingredient entity from the database
            IngredientRow(ingredient: ingredient)
        }
        .navigationTitle("Ingredients")
    }
    
    func addIngredient() {
        guard !title.isEmpty, !unit.isEmpty else { return } // No empty fields
        let ingredient = MyIngredient(
            title: title,
            amount: amount,
            unit: unit
        )
        context.insert(ingredient)
        
        // Reset input fields when done
        title = ""
        amount = 0
        unit = ""
    }
    
    func deleteItem(_ ingredient: MyIngredient) {
        context.delete(ingredient)
    }
    
    func deleteAllIngredients() {
        myIngredients.forEach { ingredient in
            context.delete(ingredient)
        }
    }
}

#Preview {
    NavigationStack {
        MyIngredientList()
            .modelContainer(previewContainer)
    }
}
