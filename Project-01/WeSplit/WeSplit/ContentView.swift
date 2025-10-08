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
    //Primero debemos crear nuestras variables que seran leidas por la UI
    @State private var totalCuenta = 0.0
    @State private var cantidadPersonas = 2
    @State private var cantidadDePropina = 10
    
    @FocusState private var isFocused: Bool
    
    //Crear una lista con las propinas disponibles
    let propinas = [10, 15, 20, 25,0]
    //Crear la variable computada que calculara el valor de la cantidada por persona
    var cantidadPorPersona: Double {
            let personas = Double(cantidadPersonas + 2)
            let propinaSeleccionada = Double(cantidadDePropina)
            
            let valorPropina = totalCuenta * propinaSeleccionada / 100
            let totalConPropina = totalCuenta + valorPropina
            let totalPorPersona = totalConPropina / personas
            
            return totalPorPersona
        }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Total de la Cuenta:",value: $totalCuenta,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    Picker("Number of people",selection: $cantidadPersonas){
                        ForEach(1...10, id: \.self){
                            Text("\($0) people")
                        }
                    }
                }
                Section("CUANTO QUIERES DEJAR DE PROPINA?") {
                    Picker("Cantidad de Propina",selection: $cantidadDePropina){
                        ForEach(propinas,id : \.self){
                            Text($0,format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                        Text(cantidadPorPersona,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar{
                if isFocused{
                    Button("Hecho"){
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

