//
//  PreviewData.swift
//  SwiftFood
//
//  Created by Trevor Hafner on 12/12/2024.
//

import Foundation
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: MyIngredient.self, Recipe.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        let ingredients = [MyIngredient(title: "Lemon", amount: 5, unit: "count"), MyIngredient(title: "Sugar", amount: 1, unit: "kilogram"), MyIngredient(title: "Salt", amount: 2, unit: "kilogram"), MyIngredient(title: "Rum", amount: 750, unit: "milliliters")]
        ingredients.forEach({ container.mainContext.insert($0) })
        return container
    } catch {
        fatalError("Could not load preview data: \(error).")
    }
}()
