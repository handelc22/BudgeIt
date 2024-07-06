//
//  PurchasesView.swift
//  BudgeIt
//
//  Created by Colleen Handel on 7/5/24.
//

import SwiftUI

struct PurchasesView: View {
    @EnvironmentObject var viewModel: BudgeItViewModel
    
    var body: some View {
        List(viewModel.purchases) { purchase in
            VStack(alignment: .leading) {
                Text(purchase.category)
                Text("\(purchase.amount, specifier: "%.2f")")
                Text(purchase.date, style: .date)
            }
        }
        .navigationTitle("Purchases")
    }
}


#Preview {
    PurchasesView()
}
