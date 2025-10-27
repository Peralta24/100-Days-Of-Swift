//
//  ContentView.swift
//  iExpense
//
//  Created by Jose Rafael Peralta Martinez  on 27/10/25.
//

import SwiftUI
@Observable
class User {
    var firstName = "Jose"
    var lastName = "Peralta"
}

@Observable
class Numero {
    var contador = 0
    
    func aumentar () {
        contador += 1
    }
}
struct secondView : View {
    var name : String
    var body: some View {
        Text("Hello to the second view \(name)")
    }
}
struct ContentView: View {
    @State private var user = User()
    @State private var numero = Numero()
    @State private var showSecondView = false

    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            TextField("First Name",text: $user.firstName)
            TextField("Last Name",text: $user.lastName)
            
            Text("Contador \(numero.contador)")
            Button("Aumentar"){
                numero.aumentar()
            }
            
            Button("Go to the second View"){
                showSecondView.toggle()
            }
        }
        .sheet(isPresented: $showSecondView){
            secondView(name : "\(user.firstName) \(user.lastName)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
