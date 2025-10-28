//
//  AddView.swift
//  iExpense
//
//  Created by Jose Rafael Peralta Martinez  on 28/10/25.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    var expenses : Expenses
    let types = ["Bussines", "Personal"]
    var body: some View {
        NavigationStack {
            Form{
                TextField("Name", text: $name)
                Picker("Type",selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle(Text("Add Expense"))
            .toolbar{
                Button("Save"){
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
