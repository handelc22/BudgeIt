//
//  DBHelper.swift
//  BudgeIt
//
//  Created by Colleen Handel on 7/5/24.
//

import Foundation
import SQLite

public class DBHelper {
    static let shared = DBHelper() // Singleton instance

    private let dbConnection: Connection?

    public init() {
        // Path to SQLite database file in the app's Documents directory
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
        ).first!
        do {
            dbConnection = try Connection("\(path)/purchases.sqlite3")
            createTable()
        } catch {
            dbConnection = nil
            print ("Unable to open database")
        }
    }

    private func createTable() {
        do {
            try dbConnection?.run(PurchaseTable.shared.table.create { table in
                table.column(PurchaseTable.shared.id, primaryKey: true)
                table.column(PurchaseTable.shared.itemName)
                table.column(PurchaseTable.shared.amount)
                // Add other columns as needed
            })
        } catch {
            print("Unable to create table: \(error)")
        }
    }

    public func addPurchase2(itemName: String, amount: Double) -> Int64? {
        print("hitting addPurchase2??")
        do {
            let insert = PurchaseTable.shared.table.insert(
                PurchaseTable.shared.itemName <- itemName,
                PurchaseTable.shared.amount <- amount
                // Add other columns as needed
            )
            let insertedRowId = try dbConnection!.run(insert)
            return insertedRowId
        } catch {
            print("Insert failed: \(error)")
            return nil
        }
    }

    /*func getAllPurchases() -> [Purchase] {
        var purchases = [Purchase]()
        do {
            for row in try dbConnection!.prepare(PurchaseTable.shared.table) {
                let purchase = Purchase(
                    id: row[PurchaseTable.shared.id],
                    itemName: row[PurchaseTable.shared.itemName],
                    amount: row[PurchaseTable.shared.amount]
                    // Map other columns to Purchase properties
                )
                purchases.append(purchase)
            }
        } catch {
            print("Select failed: \(error)")
        }
        return purchases
    }*/
}
