//
//  ContentView.swift
//  Edutainment
//
//  Created by Jose Rafael Peralta Martinez  on 24/10/25.
//
//Aplicion que permita seleccionar la tabla de multiplicar de 2 a 12
//Poder seleccionar cuantas preguntas desea que le hagan de 5,10 o 20
//Generar aleatoriamente tantas preguntas como nos pidieron , dentro del rango de dificultad solicitado[5,10,20]



import SwiftUI

struct ContentView: View {
    @State private var selectTable = 2
    @State private var selectNumberOfQuestions = 5
    @State private var numberOfQuestions = [5,10,20]
    var body: some View {
        Form {
            //Seccion de eleccion de tabla
            Section("Select the table you wanna practice"){
                Stepper("Table of \(selectTable)",value: $selectTable, in: 2...12)
            }
            //Seccion de eleccion de preguntas
            Section("Select how many questions do you want"){
                Picker("Number of questions", selection: $selectNumberOfQuestions){
                    ForEach(numberOfQuestions, id: \.self){ number in
                        Text("\(number)")
                    }
                }
                .pickerStyle(.segmented)
            }
        }
    }
    

}

#Preview {
    ContentView()
}
