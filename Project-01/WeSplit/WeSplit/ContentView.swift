//
//  ContentView.swift
//  WeSplit
//
//  Created by Jose Rafael Peralta Martinez  on 06/10/25.
//
//probar git
//Ejecutar el simulador Cmd+R
import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0

    var body: some View {
        NavigationStack{
            Button("Tap Count: \(tapCount)") {
                tapCount += 1
            }
            .navigationTitle(Text("Tap Count"))
            .navigationBarTitleDisplayMode(.large)
        }

    }
}

#Preview {
    ContentView()
}
