//
//  RecipeCreate.swift
//  SwiftFood
//
//  Created by Matthew Caballero on 12/11/24.
//

import SwiftUI
import SwiftData

struct RecipeCreate: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @Query private var myRecipes: [Recipe]
    
    @State private var title: String = ""
    @State private var time_required: Float = 0.0
    @State private var servings_amount: Int = 0
    @State private var instructions: String = ""
    
    // Used below for the number field, to show decimal correctly
    private var decimalFormatter: NumberFormatter {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 2
            return formatter
        }
    
    var body: some View {
        VStack {
            Text("New Recipe")
                .font(.title2)
                .fontWeight(.bold)
            
            // Text input fields
            // Uses accessibility identifiers, easy to access during testing
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Title: ")
                    TextField("Recipe Title", text: $title)
                        .accessibilityIdentifier("CreateRecipeTitle")
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 110)
                }
                HStack {
                    Text("Time Required:")
                    TextField("Time Required", value: $time_required, formatter: decimalFormatter)
                        .accessibilityIdentifier("CreateRecipeTimeRequired")
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                        .frame(width: 40)
                    Text("hours")
                }
                HStack {
                    Text("Number of Servings: ")
                    TextField("Number of Servings", value: $servings_amount, formatter: NumberFormatter())
                        .accessibilityIdentifier("CreateRecipeServingsAmount")
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .frame(width: 40)
                    Text("servings")
                }
                Text("Instructions: ")
                ScrollView {
                    TextEditor(text: $instructions)
                        .accessibilityIdentifier("CreateRecipeInstructions")
                        .frame(height: 150) // Fixed height
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
                }
            }
            // Add button
            Button("Add Recipe") {
                // Trigger add recipe function
                addRecipe()
                // Close current view / go back in the nav stack
                dismiss()
            }
            .accessibilityIdentifier("AddRecipeButton")
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }

    func addRecipe() {
        guard !title.isEmpty, time_required > 0, servings_amount > 0, !instructions.isEmpty else { return } // No empty inputs
        let recipe = Recipe(
            title: title,
            time_required: time_required,
            servings_amount: servings_amount,
            instructions: instructions
        )
        context.insert(recipe)
        
        // Resetting input fields
        title = ""
        time_required = 0.0
        servings_amount = 0
        instructions = ""
    }
}

#Preview {
    ContentView()
}
