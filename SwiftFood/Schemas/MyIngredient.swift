//
//  MyIngredient.swift
//  SwiftFood
//
//  Created by Matthew Caballero on 12/7/24.
//

import Foundation
import SwiftData

@Model
class MyIngredient: Identifiable {
    
    var id: String
    var title: String
    var amount: Int
    var unit: String
    
    init(title: String, amount: Int, unit: String) {
        
        self.id = UUID().uuidString
        self.title = title
        self.amount = amount
        self.unit = unit
    }
}
