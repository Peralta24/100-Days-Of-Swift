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
    @Environment(\.dismiss) var dismiss
    var name : String
    var body: some View {
        Text("Hello to the second view \(name)")
        Button("Back to the main shett"){
            dismiss()
        }
    }
}
struct ContentView: View {
    @State private var user = User()
    @State private var numero = Numero()
    @State private var showSecondView = false
    @State private var numberOfRows = [Int]()
    @State private var numberActual = 1

    var body: some View {
        NavigationStack {
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
                Button("Bakc"){
                    showSecondView = false
                }
            }
            .sheet(isPresented: $showSecondView){
                secondView(name : "\(user.firstName) \(user.lastName)")
            }
            List {
                ForEach(numberOfRows, id: \.self){
                    Text("\($0)")
                }
                .onDelete(perform: deleteRow)
            }
            Button("Add Row"){
                numberOfRows.append(numberActual)
                numberActual += 1
            }
            .toolbar{
                EditButton()
            }
        }
     
    }
    
    func deleteRow(at offsets: IndexSet) {
        numberOfRows.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
