//
//  ContentView.swift
//  MotivationalPhrasesApp
//
//  Created by Jose Rafael Peralta Martinez  on 11/10/25.
//

import SwiftUI


struct ContentView: View {
    let motivationalPhrases = [
        "Code is like humor. When you have to explain it, it’s bad.",
        "Keep calm and code in Swift.",
        "Programming is thinking, not typing.",
        "Swift makes your ideas come to life faster.",
        "Don’t just write code, write elegant code.",
        "Every great app starts with a single line of Swift.",
        "Mistakes are proof that you are trying.",
        "Debugging is like being a detective in a crime movie.",
        "Learning Swift is learning to think logically.",
        "Your code can change the world, one app at a time.",
        "Consistency beats complexity in programming.",
        "Fail fast, learn faster.",
        "Code today, ship tomorrow.",
        "Writing code is an art, Swift is your brush.",
        "Keep coding, keep improving.",
        "Swift is powerful, but your creativity is even more.",
        "One line of code can change everything.",
        "Think in Swift, act like a developer.",
        "Good code is short, clear, and simple.",
        "Every bug is an opportunity to learn something new.",
        "Code is poetry, Swift is the language.",
        "The best way to learn Swift is by building apps.",
        "Don’t just read tutorials, make something amazing.",
        "Your keyboard is your paintbrush, Swift your canvas.",
        "Small steps every day lead to big apps.",
        "SwiftUI makes design and code speak the same language.",
        "Writing code is a journey, not a destination.",
        "Stay curious, stay coding.",
        "If it compiles, celebrate! If it works, celebrate more!",
        "Push yourself to write better code than yesterday.",
        "The future belongs to those who code it.",
        "Embrace challenges, they are the best teachers.",
        "Your first app won’t be perfect, but it will be yours.",
        "Think like a programmer, solve like a Swift developer.",
        "Every great app started as an idea on a whiteboard."
    ]
    
    @State private var currentPhrase = "Press the button to see a new motivational phrase!"
    

    var body: some View {
        ZStack{
            LinearGradient(colors: [.gray,.red], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(edges: .all)
            VStack (spacing: 20) {
                
   
                Spacer()
                Spacer()
                Text("Your Daily Dose of Code")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Text(currentPhrase)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                
                Button{
                    
                    withAnimation{
                        changePhrase()
                    }
                }label: {
                    Text("New Phrase")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .padding()
                        .background(.secondary)
                        .foregroundColor(.cyan)
                        .clipShape(.capsule)
                        .shadow(radius: 5)
                }
                
                
                Spacer()
                Spacer()
                
                
            }
            .padding()
        }
    }
    
    func changePhrase() {
        currentPhrase = motivationalPhrases.randomElement() ?? "none"
    }
    
    
}

#Preview {
    ContentView()
}
