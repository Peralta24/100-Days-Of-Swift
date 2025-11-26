//
//  ContentView.swift
//  BookWorm
//
//  Created by Jose Rafael Peralta Martinez  on 25/11/25.
//
import SwiftData
import SwiftUI
struct ButtonConfirm : View {
    var title: String
    @Binding var isOn : Bool
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
    }
}
struct ContentView : View {
    @Environment(\.modelContext) var modelContext
    @Query var students : [Student]
    @State var isPresented = false
    @AppStorage("notes") var notes = ""
    var body: some View {
        NavigationStack {
            List(students) {student in
                Text(student.name)
            }
            
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add"){
                    let firtsName = ["Ginny","Harry","Hermiones","Luna","Ron"]
                    let lastName = ["Weasley","Potter","Granger","Lovegood","Weasley"]
                    let chosenFirsName = firtsName.randomElement()!
                    let chosenLastName = lastName.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(chosenFirsName) \(chosenLastName)")
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
