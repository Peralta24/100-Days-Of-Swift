//
//  ContentView.swift
//  WeSplit
//
//  Created by Jose Rafael Peralta Martinez  on 06/10/25.
//
//probar git
//Ejecutar el simulador Cmd+R
import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0//Revisar el total de la cuenta
    @State private var numberOfPeople = 2//Cuantas personas pagaran la cuenta
    @State private var tipPercentage = 10//Que porcentaje de propina dejaremos
    
    @FocusState private var isFocused: Bool
    
    let tipPercentages = [10,15,20,25,0]//Opciones de propina
    
    var totalPerPerson : Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD" ))
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    
                    Picker("Number of people",selection: $numberOfPeople){
                        ForEach(2..<10){
                            Text("\($0) people")
                        }
                    }
                }
                Section("How much do you want to tip?"){
                    
                    Picker("Tip percentage",selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section{
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle(Text("WeSplit"))
            .toolbar{
                if isFocused {
                    Button("Done"){
                        isFocused = false
                    }
                }
            }
        }

    }
}
#Preview {
    ContentView()
}
