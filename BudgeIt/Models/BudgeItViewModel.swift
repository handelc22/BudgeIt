//
//  BudgeItViewModel.swift
//  BudgeIt
//
//  Created by Colleen Handel on 7/5/24.
//

import Foundation
/*import DBHelper*/

class BudgeItViewModel: ObservableObject {
    @Published var purchases: [DBHelper.Purchase] = []
    @Published var totalSpent: Double = 0.0
    @Published var totalBudget: Double = 1000.0 // Example budget
    /*@Published var budgetCategories: [BudgetCategory] = [
        BudgetCategory(name: "Food", budget: 500, spent: 0),
        BudgetCategory(name: "Entertainment", budget: 200, spent: 0),
        BudgetCategory(name: "Transportation", budget: 100, spent: 0)
    ]*/
    
    init() {
        loadPurchases()
    }

    func loadPurchases() {
        purchases = DBHelper.shared.getAllPurchases()
        calculateTotalSpent()
    }
    
    func addPurchase(itemName: String, amount: Double) {
         if let _ = DBHelper.shared.addPurchase(itemName: itemName, amount: amount) {
             loadPurchases() // Reload purchases to update the view
         }
     }
    
    private func calculateTotalSpent() {
        totalSpent = purchases.reduce(0) { $0 + $1.amount }
    }
    
    /*var totalSpent: Double {
        purchases.reduce(0) { $0 + $1.amount }
    }
    
    var totalBudget: Double {
        budgetCategories.reduce(0) { $0 + $1.budget }
    }*/
    
    /*func addPurchase(category: String, amount: Double) {
        print("hitting add purchase!")
        let purchase = Purchase(category: category, amount: amount, date: Date())
        purchases.append(purchase)
        
        if let index = budgetCategories.firstIndex(where: { $0.name == category }) {
            budgetCategories[index].spent += amount
        }
        print("okay, right before we try to really add it")
        /*let myTest = DBHelper()*/
        /*myTest.addPurchase2(itemName:"test", amount:1)*/
        DBHelper.shared.addPurchase2(itemName:"test", amount:1)
    }*/
}
