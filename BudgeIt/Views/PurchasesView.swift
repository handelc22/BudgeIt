//
//  PurchasesView.swift
//  BudgeIt
//
//  Created by Colleen Handel on 7/5/24.
//

import SwiftUI

struct PurchasesView: View {
    @State private var showingAddPurchaseView = false
    @StateObject var viewModel = BudgeItViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.purchases) { purchase in
                VStack(alignment: .leading) {
                    Text(purchase.itemName)
                        .font(.headline)
                    Text(String(format: "$%.2f", purchase.amount))
                        .font(.subheadline)
                }
            }
            .navigationTitle("Purchases")
            /*.navigationBarItems(trailing: Button(action: {
                showingAddPurchaseView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddPurchaseView) {
                AddPurchaseView()
                    .environmentObject(viewModel)
            }*/
            
        }
    }
}

struct PurchasesView_Previews: PreviewProvider {
    static var previews: some View {
        PurchasesView().environmentObject(BudgeItViewModel())
    }
}
