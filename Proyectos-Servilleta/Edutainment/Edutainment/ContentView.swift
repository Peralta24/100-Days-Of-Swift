import SwiftUI

// Modelo de pregunta
struct Question {
    let text: String
    let answer: Int
}

struct ContentView: View {
    // Configuración del juego
    @State private var selectTable = 2
    @State private var selectNumberOfQuestions = 5
    let numberOfQuestions = [5,10,20]
    
    // Estado del juego
    @State private var questions = [Question]()
    @State private var currentQuestionIndex = 0
    @State private var currentAnswer = ""
    @State private var resultMessage = ""
    @State private var puntuacionUsuario = 0
    @State private var gameStarted = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                if !gameStarted {
                    // Configuración inicial
                    Form {
                        Section("Select the table to practice") {
                            Stepper("Table: \(selectTable)", value: $selectTable, in: 2...12)
                        }
                        
                        Section("Select number of questions") {
                            Picker("Number of questions", selection: $selectNumberOfQuestions) {
                                ForEach(numberOfQuestions, id: \.self) { number in
                                    Text("\(number)")
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                        Button("Start Game") {
                            startGame()
                        }
                    }
                } else {
                    // Juego activo
                    VStack(spacing: 15) {
                        if currentQuestionIndex < questions.count {
                            Text(questions[currentQuestionIndex].text)
                                .font(.title)
                                .bold()
                            
                            TextField("Your answer", text: $currentAnswer)
                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            
                            Button("Check Answer") {
                                checkAnswer()
                            }
                            
                            Text(resultMessage)
                                .font(.headline)
                                .foregroundColor(resultMessage == "Correct ✅" ? .green : .red)
                            
                            Text("Score: \(puntuacionUsuario)")
                        } else {
                            // Juego terminado
                            Text("🎉 You finished the game! 🎉")
                                .font(.title2)
                            Text("Final Score: \(puntuacionUsuario) / \(questions.count)")
                            
                            Button("Play Again") {
                                resetGame()
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Edutainment")
        }
    }
    
    // MARK: - Funciones del juego
    func startGame() {
        questions.removeAll()
        puntuacionUsuario = 0
        currentQuestionIndex = 0
        resultMessage = ""
        currentAnswer = ""
        gameStarted = true
        
        // Generar preguntas
        for _ in 1...selectNumberOfQuestions {
            let randomNumber = Int.random(in: 2...12)
            let qText = "\(selectTable) x \(randomNumber)"
            let qAnswer = selectTable * randomNumber
            questions.append(Question(text: qText, answer: qAnswer))
        }
    }
    
    func checkAnswer() {
        guard currentQuestionIndex < questions.count else { return }
        
        let correctAnswer = questions[currentQuestionIndex].answer
        if currentAnswer == String(correctAnswer) {
            resultMessage = "Correct ✅"
            puntuacionUsuario += 1
        } else {
            resultMessage = "Incorrect ❌"
            if puntuacionUsuario > 0 { puntuacionUsuario -= 1 }
        }
        
        // Limpiar respuesta y pasar a siguiente pregunta
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            resultMessage = ""
            currentAnswer = ""
            currentQuestionIndex += 1
        }
    }
    
    func resetGame() {
        gameStarted = false
        questions.removeAll()
        currentQuestionIndex = 0
        puntuacionUsuario = 0
        currentAnswer = ""
        resultMessage = ""
    }
}

#Preview {
    ContentView()
}
