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
        VStack {
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
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
