//
//  ContentView.swift
//  iFriends
//
//  Created by Jose Rafael Peralta Martinez  on 04/12/25.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var amigos: [Users] = []
    
    var body: some View {
        NavigationStack {
                        List(amigos) { amigo in
                NavigationLink(value: amigo){
                    VStack(alignment: .leading) {
                        Text(amigo.name)
                            .font(.headline)
                            .fontWeight(.black)
                            .foregroundStyle(.blue)
                        
                        HStack {
                            Text(amigo.email)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Spacer()
                            Text(amigo.isActive ? "Activo": "Inactivo")
                                .font(.subheadline)
                                .foregroundStyle(amigo.isActive ? .green: .red)
                                .fontWeight(.bold)
                        }
                    }
                }
            }
            .navigationTitle("My friends")
            .navigationDestination(for: Users.self, destination: { user in
                
                DetailFriendView(user: user,allUsers: amigos)
            })
        }
        
        .task {
            await fethcFriend()
        }
    }
    
    func fethcFriend() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("URL inválida")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            
            
            let friendsDecoder = try decoder.decode([Users].self, from: data)
            
                        self.amigos = friendsDecoder
        } catch let decodingError as DecodingError {
            print("Error de Decodificación de JSON: \(decodingError)")
        } catch {
            print("Error de red o desconocido: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
