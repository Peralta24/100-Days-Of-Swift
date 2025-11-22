//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Jose Rafael Peralta Martinez  on 21/11/25.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String?
}

struct ContentView: View {
    @State private var results = [Result]()
    @State private var userName = ""
    @State private var email = ""
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                
                Text(item.collectionName ?? "Unknown album")
                
                
            }
        }
        AsyncImage(url: URL(string : "https://hws.dev/img/logo.png"),scale: 12)
        
        AsyncImage(url: URL(string:"https://hws.dev/img/logo.png")){image in
                image
                .resizable()
                .scaledToFit()
        }placeholder: {
            ProgressView()
        }
        
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")){phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            }else if phase.error != nil {
                Text("There was an error loading the image")
            }else {
                ProgressView()
            }
        }
        .frame(width: 200,height: 200)

        Form {
            Section {
                TextField("User name", text: $userName)
                TextField("Email", text: $email)
            }
            Section {
                Button("Create account"){
                    print("Creating acount")
                }
            }
            .disabled(userName.isEmpty || email.isEmpty)
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=nf&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
            results = decodedResponse.results
        } catch {
            print("Error: \(error)")
        }
    }
}

#Preview {
    ContentView()
}
