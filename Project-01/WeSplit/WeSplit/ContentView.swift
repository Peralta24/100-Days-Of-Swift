//
//  ContentView.swift
//  WeSplit
//
//  Created by Jose Rafael Peralta Martinez on 06/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var totalCuenta = 0.0
    @State private var cantidadPersonas = 1
    @State private var cantidadDePropina = 10
    @FocusState private var isFocused: Bool
    
    let propinas = [10, 15, 20, 25, 0]
    
    var amountPerPerson: Double {
        let people = Double(cantidadPersonas)
        let tip = Double(cantidadDePropina)
        let tipAmount = totalCuenta * tip / 100
        let totalWithTip = totalCuenta + tipAmount
        return totalWithTip / people
    }
    
    var totalWithTip: Double {
        let tip = Double(cantidadDePropina)
        return totalCuenta + (totalCuenta * tip / 100)
    }
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Minimal background
                Color(.systemGray6)
                    .ignoresSafeArea()
                
                Form {
                    Section {
                        TextField(
                            "Enter total amount 💰",
                            value: $totalCuenta,
                            format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                        )
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                        
                        Picker("Number of people 👥", selection: $cantidadPersonas) {
                            ForEach(1...12, id: \.self) {
                                Text("\($0) people")
                            }
                        }
                    }
                    
                    Section("Tip percentage 💵") {
                        Picker("Tip", selection: $cantidadDePropina) {
                            ForEach(propinas, id: \.self) {
                                Text("\($0)%")
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section("Amount per person 🧾") {
                        Text(amountPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                    
                    Section("Total with tip 🏦") {
                        Text(totalWithTip, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .font(.body)
                            .foregroundColor(cantidadDePropina == 0 ? .red : .secondary)
                            
                    }
                }
                .scrollContentBackground(.hidden) // Show background color
                .background(Color(.systemGray6))
                .navigationTitle("WeSplit 💰")
                .toolbar {
                    if isFocused {
                        Button("Done") {
                            isFocused = false
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
