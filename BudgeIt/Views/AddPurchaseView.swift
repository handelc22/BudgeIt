//
//  AddPurchaseView.swift
//  BudgeIt
//
//  Created by Colleen Handel on 7/5/24.
//

import SwiftUI

struct AddPurchaseView: View {
    @EnvironmentObject var viewModel: BudgeItViewModel
    @State private var selectedCategory = "Food"
    @State private var amount: String = ""
    
    var body: some View {
        Form {
            Picker("Category", selection: $selectedCategory) {
                ForEach(viewModel.budgetCategories) { category in
                    Text(category.name).tag(category.name)
                }
            }
            
            TextField("Amount", text: $amount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            
            Button("Add Purchase") {
                if let amount = Double(amount) {
                    viewModel.addPurchase(category: selectedCategory, amount: amount)
                }
            }
        }
        .navigationTitle("Add Purchase")
    }
}


#Preview {
    AddPurchaseView()
}
