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
    
    let tipPercentages = [10,15,20,25,0]//Opciones de propina
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD" ))
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people",selection: $numberOfPeople){
                        ForEach(2..<10){
                            Text("\($0) people")
                        }
                    }
                }
                Section{
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle(Text("WeSplit"))
        }

    }
}


#Preview {
    ContentView()
}
