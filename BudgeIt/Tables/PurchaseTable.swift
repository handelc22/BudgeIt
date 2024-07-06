//
//  PurchaseTable.swift
//  BudgeIt
//
//  Created by Colleen Handel on 7/5/24.
//

import Foundation
import SQLite

struct PurchaseTable {
    static let shared = PurchaseTable()

    let table = Table("purchases")
    let id = Expression<Int64>("id")
    let itemName = Expression<String>("itemName")
    let amount = Expression<Double>("amount")
    // Define other columns as needed
}
