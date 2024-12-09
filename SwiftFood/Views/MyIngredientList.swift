//
//  MyIngredientList.swift
//  SwiftFood
//
//  Created by Matthew Caballero on 12/7/24.
//

// Test change

import SwiftUI
import SwiftData

struct MyIngredientList: View {
    @Environment(\.modelContext) private var context
    @Query private var myIngredients: [MyIngredient]
    
    @State private var title: String = ""
    @State private var amount: Int = 0
    @State private var unit: String = ""
    
    var body: some View {
        VStack {
            Text("My Ingredients")
                .font(.headline)
            
            // Text input fields
            // Uses accessibility identifiers, easy to access during testing
            VStack(alignment: .leading, spacing: 10) {
                TextField("Ingredient Title", text: $title)
                    .accessibilityIdentifier("Title")
                    .textFieldStyle(.roundedBorder)
                
                HStack {
                    TextField("Amount", value: $amount, formatter: NumberFormatter())
                        .accessibilityIdentifier("Amount")
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                    
                    TextField("Unit", text: $unit)
                        .accessibilityIdentifier("Unit")
                        .textFieldStyle(.roundedBorder)
                }
            }
            
            // Buttons, add delete
            HStack {
                Button("Add Ingredient") {
                    addIngredient()
                }
                .accessibilityIdentifier("AddButton")
                .buttonStyle(.borderedProminent)
                
                Button("Delete All") {
                    deleteAllIngredients()
                }
                .buttonStyle(.bordered)
            }
            .padding()
            
            List {
                // For each ingredient in myingredient context
                ForEach(myIngredients) { ingredient in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(ingredient.title)
                                .font(.headline)
                            
                            HStack {
                                Text("\(ingredient.amount)")
                                Text(ingredient.unit)
                            }
                        }
                        Spacer()
                        
                        // Delete Button
                        Button(action: {
                            deleteItem(ingredient)
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(.borderless) // To avoid affecting list row interaction
                    }
                }
            }
        }
        .padding()
    }
    
    func addIngredient() {
        guard !title.isEmpty, !unit.isEmpty else { return } // Prevent empty input
        let ingredient = MyIngredient(
            title: title,
            amount: amount,
            unit: unit
        )
        context.insert(ingredient)
        
        // Resetting input fields
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
    ContentView()
}
