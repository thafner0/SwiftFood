//
//  Recipe.swift
//  SwiftFood
//
//  Created by Matthew Caballero on 12/11/24.
//

import Foundation
import SwiftData

@Model
class Recipe: Identifiable {
    
    var id: String
    var title: String
    var time_required: Float
    var servings_amount: Int
    var instructions: String
    
    init(title: String, time_required: Float, servings_amount: Int, instructions: String) {
        
        self.id = UUID().uuidString
        self.title = title
        self.time_required = time_required
        self.servings_amount = servings_amount
        self.instructions = instructions
    }
}
