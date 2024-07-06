//
//  HomeView.swift
//  BudgeIt
//
//  Created by Colleen Handel on 7/5/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: BudgeItViewModel
    
    var body: some View {
        VStack {
            Text("Total Spending: \(viewModel.totalSpent, specifier: "%.2f")")
            Text("Total Budget: \(viewModel.totalBudget, specifier: "%.2f")")
            ProgressView(value: viewModel.totalSpent, total: viewModel.totalBudget)
                .padding()
            
            NavigationLink(destination: AddPurchaseView()) {
                Text("Add Purchase")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .navigationTitle("Home")
    }
}


#Preview {
    HomeView()
}
