//
//  HomeView.swift
//  BudgeIt
//
//  Created by Colleen Handel on 7/5/24.
//

import SwiftUI

struct HomeView: View {
    /*@EnvironmentObject var viewModel: BudgeItViewModel*/
    @StateObject var viewModel = BudgeItViewModel()
    @State private var showingAddPurchaseView = false
    
    var body: some View {
        VStack {
            Text("Total Spending: \(viewModel.totalSpent, specifier: "%.2f")")
            Text("Total Budget: \(viewModel.totalBudget, specifier: "%.2f")")
            ProgressView(value: viewModel.totalSpent, total: viewModel.totalBudget)
                .padding()
            
            
            // Add Purchase Button
            Button(action: {
                showingAddPurchaseView = true // Toggle showingAddPurchaseView to true
            }) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Add Purchase")
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .padding()
            }
            .sheet(isPresented: $showingAddPurchaseView) {
                AddPurchaseView()
                    .environmentObject(viewModel)
            }

            Spacer()
            
            /*Button(destination: AddPurchaseView()) {
                Text("Add Purchase2")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }*/
        }
        .padding()
        .navigationTitle("Home")
    }
}


#Preview {
    HomeView()
}
