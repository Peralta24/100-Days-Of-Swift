//
//  ContentView.swift
//  Navigation
//
//  Created by Jose Rafael Peralta Martinez  on 07/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path){
            List {
                ForEach(0..<5){ i in
                    NavigationLink("Select Number : \(i)", value: i)
                }
                
                ForEach(0..<5){ i in
                    NavigationLink("Select String : \(i)",value : String(i))
                }
            }
            .toolbar {
                Button("Add number"){
                    path.append(10)
                }
                
                Button("Add string"){
                    path.append("Hello World")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("Your number is \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("Your string is \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}

