//
//  Models.swift
//  BudgeIt
//
//  Created by Colleen Handel on 7/5/24.
//

import Foundation

struct Purchase: Identifiable {
    let id = UUID()
    let category: String
    let amount: Double
    let date: Date
}

struct BudgetCategory: Identifiable {
    let id = UUID()
    let name: String
    var budget: Double
    var spent: Double
}
