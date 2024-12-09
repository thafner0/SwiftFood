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
                .modelContainer(for: [MyIngredient.self]) // Attach ModelContainer
        }
    }
}
