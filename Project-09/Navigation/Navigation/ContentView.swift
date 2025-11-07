//
//  ContentView.swift
//  Navigation
//
//  Created by Jose Rafael Peralta Martinez  on 07/11/25.
//

import SwiftUI
struct DetailView: View {
    var number : Int
    var body: some View {
        Text("Detail view \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("The number is \(number)")
    }
}
struct Student : Hashable {
    let id = UUID()
    var name : String
}

var students = [Student](repeating: .init(name: "Jose"), count: 100)
struct ContentView: View {
    var body: some View {
        NavigationStack{
            List(0..<100){ i in
                NavigationLink("Select \(i)",value: i)
                NavigationLink("Student",value:students[i])
            }
            .navigationDestination(for: Int.self){ selection in
                Text("Your selection is \(selection)")
            }
            .navigationDestination(for: Student.self) { student in
                Text("Hello, \(student.name)")
            }
        }
    }
}

#Preview {
    ContentView()
}
