//
//  ContentView.swift
//  BudgeIt
//
//  Created by Colleen Handel on 7/5/24.
//

import SwiftUI
import SwiftUICharts
import SwiftData

struct CategoryExpense {
    let category: String
    let amount: Double
}

struct ContentView: View {
    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    
    let dataPoints = ["Jan", "Feb", "Mar", "Apr", "May"]
    let values = [100, 120, 80, 200, 150]
    
    @StateObject var viewModel = BudgeItViewModel()
    
    let categoryExpenses = [
        CategoryExpense(category: "Food", amount: 300),
        CategoryExpense(category: "Transportation", amount: 150),
        CategoryExpense(category: "Entertainment", amount: 200),
        // Add more categories as needed
    ]
    
    var body: some View {
        
        VStack {
            Text("Monthly Expenses")

            BarChartView(data: ChartData(values: [("2018 Q4",63150), ("2019 Q1",50900), ("2019 Q2",77550), ("2019 Q3",79600), ("2019 Q4",92550)]), title: "Spending By Category", legend: "Quarterly", style: Styles.barChartMidnightGreenLight, form: ChartForm.medium, animatedToBack: true) // legend is optional
                .frame(height: 300)
                .padding()

            // Other views or controls in your SwiftUI hierarchy
        }
        
        TabView {
            NavigationView {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            NavigationView {
                PurchasesView()
            }
            .tabItem {
                Image(systemName: "list.bullet")
                Text("Purchases")
            }
            
            NavigationView {
                BudgetCategoriesView()
            }
            .tabItem {
                Image(systemName: "chart.pie.fill")
                Text("Budget Categories")
            }
        }
        .environmentObject(viewModel)
    }

}
