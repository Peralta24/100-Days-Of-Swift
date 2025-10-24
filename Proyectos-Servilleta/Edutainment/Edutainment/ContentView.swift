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
    @State private var question = [String]()
    @State private var currentQuestion = ""
    @State private var correctAnswers = [Int]()
    @State private var answerUser = ""
    @State private var showQuestion: Bool = false
    @State private var resultMessage = ""
    var body: some View {
        NavigationStack{
            
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
                
                Section{
                    Button("Show me the questions"){
                        generateRandomQuestion(difficult: selectNumberOfQuestions, table: selectTable)
                    }
                    Text(currentQuestion)
                    TextField("Respuesta", text: $answerUser)
                        .keyboardType(.numberPad)
                    
                    Button("Comprobar"){
                        checkAnswer()
                    }
                    Text(resultMessage)
                }
            }
            .navigationTitle(Text("Edutainment"))
            .toolbar{
                Button("Reset"){
                    question.removeAll()
                    correctAnswers.removeAll()
                }
            }
            
//            .alert("Answer the question", isPresented: $showQuestion) {
//                            Button("OK", role: .cancel) { }
//                        } message: {
//                            Text(currentQuestion)
//                            TextField("Respuesta", text: $currentQuestion)
//                        }



        }
    }
    
    
    func generateRandomQuestion(difficult: Int, table: Int) {
        question.removeAll()
        correctAnswers.removeAll()
        
        for _ in 1...difficult{
            _ = table
            let randomNumber2: Int = Int.random(in: 2...12)
            question.append("\(table) x \(randomNumber2)")
            correctAnswers.append(table * randomNumber2)
        }

        if let first = question.first{
            currentQuestion = first
        }
    }
    
    func checkAnswer(){
        if answerUser == String(correctAnswers[0]){
            resultMessage = "Correct"
        }else {
            resultMessage = "Incorrect"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                resultMessage = ""
                answerUser = ""
            generateRandomQuestion(difficult: selectNumberOfQuestions, table: selectTable)
            }
    }

}

#Preview {
    ContentView()
}
