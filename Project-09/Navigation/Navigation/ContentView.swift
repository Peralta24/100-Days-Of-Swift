//
//  ContentView.swift
//  Navigation
//
//  Created by Jose Rafael Peralta Martinez  on 07/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var path = [String]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                

                Button("Add first name") {
                    path = ["Rafael"]
                    print(path)
                }
                Button("Add last name") {
                    path.append("Peralta")
                    print(path)

                }
                Button("Add full name") {
                    path = ["Rafael", "Peralta"]
                    print(path)

                }
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected: \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}

