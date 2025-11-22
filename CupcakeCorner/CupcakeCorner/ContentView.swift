//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Jose Rafael Peralta Martinez  on 21/11/25.
//

import SwiftUI

struct Response: Codable {
    var results : [Result]
}

struct Result : Codable {
    var trackId : Int
    var trackName : String
    var collectionName : String
}


struct ContentView: View {
 @State private  var canciones = [Result]()
    @State private var nameUser = ""
    @State private var emailUser = ""
     private var isDisable : Bool {
        nameUser.isEmpty || emailUser.isEmpty
    }
var body: some View {
        NavigationStack {
            VStack{
                List(canciones, id: \.trackId){ cancion in
                        Text(cancion.trackName)
                        .font(.headline)
                    
                    Text(cancion.collectionName)
                        .font(.caption)
                }
            }
            
            .task {
                await loadSongs()
            }
            
            VStack{
                TextField("Nombre", text: $nameUser)
                TextField("Email", text: $emailUser)
                
                AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"),scale: 12)
                
                AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")){image in
                    image
                    .resizable()
                    .frame(width: 100, height: 100)
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
            }
            VStack{
                Button("Enviar"){
                    print("Enviar \(nameUser) \(emailUser)")
                }
            }
            .disabled(isDisable)
            
            .navigationTitle("Canciones NF")
        }
    
    }
    
    func loadSongs() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=nf&entity=song&limit=20")else {
            print("Error to load the songs")
            return
        }
        
        do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
            canciones = decodedResponse.results
                } catch {
                    print("Error: \(error)")
                }
    }
    
}

#Preview {
    ContentView()
}
