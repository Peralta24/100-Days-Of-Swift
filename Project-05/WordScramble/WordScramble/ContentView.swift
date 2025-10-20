//
//  ContentView.swift
//  WordScramble
//
//  Created by Jose Rafael Peralta Martinez  on 20/10/25.
//

import SwiftUI

struct ContentView: View {
    var numeros = [1,2,3,4,5,6,8,9,10]
    @State private var genteCercana = ["Mama","Papa","Hermana","Novia"]
    var body: some View {
        List {
            Section ("SECTION 1 ") {
                Text("Static Row 1")
                Text("Static Row 2")
            }
            
            Section("SECTION 2"){
                ForEach(0..<5){
                    Text("Dynamic Row \($0)")
                }
            }
            
            Section("SECTION 3"){
                Text("Static Row 3")
                Text("Static Row 4")
            }
        }
        .listStyle(.plain)
        List(numeros, id: \.self){
            Button("Button number \(String($0))",action: agregarPersona)
        }
        .listStyle(.sidebar)
        List(genteCercana, id:\.self){
            Text("Persona cercanas: \($0)")
            
            ForEach(genteCercana,id: \.self){
                Text("Personal Cercana: \($0)")
            }
        }
        .listStyle(.plain)
        
    }
    
    func agregarPersona(){
        genteCercana.append("Nueva persona agregada")
    }
}

#Preview {
    ContentView()
}
