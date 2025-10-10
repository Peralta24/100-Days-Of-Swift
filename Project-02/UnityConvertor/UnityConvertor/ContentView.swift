//
//  ContentView.swift
//  UnityConvertor
//
//  Created by Jose Rafael Peralta Martinez  on 08/10/25.
//

import SwiftUI

struct ContentView: View {
    //Crear las variables de state
    @State private var numeroEntrada: Double = 0.0
    @State private var unidaddeEntrada: String = "Metros"
    @State private var unidaddeSalida: String = "Kilometros"
    @FocusState private var isFocused: Bool
    let valoresConvercion = ["Metros", "Kilometros", "Centimetros", "Milimetros", "Yardas", "Pies", "Pulgadas"]

    var valorConvertido: Double {
        // Primero convertimos la entrada a metros
        var metros: Double = 0.0
        
        switch unidaddeEntrada {
        case "Metros":
            metros = numeroEntrada
        case "Kilometros":
            metros = numeroEntrada * 1000
        case "Centimetros":
            metros = numeroEntrada / 100
        case "Milimetros":
            metros = numeroEntrada / 1000
        case "Yardas":
            metros = numeroEntrada * 0.9144
        case "Pies":
            metros = numeroEntrada * 0.3048
        case "Pulgadas":
            metros = numeroEntrada * 0.0254
        default:
            metros = numeroEntrada
        }
        
        // Luego convertimos los metros a la unidad de salida
        switch unidaddeSalida {
        case "Metros":
            return metros
        case "Kilometros":
            return metros / 1000
        case "Centimetros":
            return metros * 100
        case "Milimetros":
            return metros * 1000
        case "Yardas":
            return metros / 0.9144
        case "Pies":
            return metros / 0.3048
        case "Pulgadas":
            return metros / 0.0254
        default:
            return metros
        }
    }


    var body: some View {
        NavigationStack {
            Form {
                Section ("Valor de la unidad") {
                    TextField("Ingrese el valor de la Unidad",
                              value: $numeroEntrada,
                              format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                }

                Section ("Seleccionada la unidad de origen"){
                    Picker(unidaddeEntrada,selection: $unidaddeEntrada){
                        ForEach(valoresConvercion, id: \.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section ("Seleccionada a la unidad destino"){
                    Picker(unidaddeSalida,selection: $unidaddeSalida){
                        ForEach(valoresConvercion, id: \.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section("Resultado"){
                    Text("Resultado: \(valorConvertido,format: .number) \(unidaddeSalida)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.blue)
                        .animation(.easeInOut,value: valorConvertido)
                }
            }
            .navigationTitle(Text("Convertidor"))
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
