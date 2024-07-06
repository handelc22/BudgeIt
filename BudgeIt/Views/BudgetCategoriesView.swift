//
//  BudgetCategoriesView.swift
//  BudgeIt
//
//  Created by Colleen Handel on 7/5/24.
//

import SwiftUI

struct BudgetCategoriesView: View {
    @EnvironmentObject var viewModel: BudgeItViewModel
    
    var body: some View {
        List(viewModel.budgetCategories) { category in
            VStack(alignment: .leading) {
                Text(category.name)
                Text("Budget: \(category.budget, specifier: "%.2f")")
                Text("Spent: \(category.spent, specifier: "%.2f")")
                ProgressView(value: category.spent, total: category.budget)
            }
        }
        .navigationTitle("Budget Categories")
    }
}


#Preview {
    BudgetCategoriesView()
}
