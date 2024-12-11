//
//  SwiftFoodApp.swift
//  SwiftFood
//
//  Created by Matthew Caballero on 12/7/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftFoodApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                // attach the model container, enables the db
                .modelContainer(for: [MyIngredient.self, Recipe.self])
        }
    }
}
