//
//  ContentView.swift
//  Navigation
//
//  Created by Jose Rafael Peralta Martinez  on 07/11/25.
//

import SwiftUI
@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        
        path = NavigationPath()
    }
    
    func save(){
        guard let representatios = path.codable else {return }
        do {
            let data = try JSONEncoder().encode(representatios)
            try data.write(to: savePath)
        }catch {
            print("Failed to save navigation data")
        }
    }
}
struct DetailView: View {
    var number: Int

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}

struct ContentView: View {
    @State private var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path){
            
            
            List(0..<100){ number in
                NavigationLink("Go to Detail \(number)"){
                    Text("Details \(number)")
                }
            }
            .navigationTitle("Details Views")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.black, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}

