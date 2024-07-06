//
//  AddPurchaseView.swift
//  BudgeIt
//
//  Created by Colleen Handel on 7/5/24.
//

import SwiftUI

struct AddPurchaseView: View {
    @Environment(\.presentationMode) var presentationMode
    /*@EnvironmentObject var viewModel: BudgeItViewModel*/
    @StateObject var viewModel = BudgeItViewModel()

    @State private var itemName: String = ""
    @State private var amount: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Purchase Details")) {
                    TextField("Item Name", text: $itemName)
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                }
                Section {
                    Button(action: addPurchase) {
                        Text("Save")
                    }
                }
            }
            .navigationTitle("Add Purchase2")
            .navigationBarItems(leading: Button(action: {
                /*print("making it here?")*/
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancel")
            })
        }
    }

    private func addPurchase() {
        print("are we getting here into AddPurchaseView?")
        guard let amountValue = Double(amount) else {
            // Handle invalid amount (e.g., show an alert)
            return
        }
        viewModel.addPurchase(itemName: itemName, amount: amountValue)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddPurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        AddPurchaseView().environmentObject(BudgeItViewModel())
    }
}

