//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jose Rafael Peralta Martinez  on 13/10/25.
//

import SwiftUI

struct Titulos : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .fontWeight(.bold)
            .padding()
            .background(.black)
            .clipShape(.rect(cornerRadius: 10))
            .textCase(.uppercase)
    }
}
extension View {
    func titulos() -> some View {
        modifier(Titulos())
    }
}
struct Descripcion : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.white)
            .padding()
        
    }
}
extension View {
    func descripcion() -> some View {
        modifier(Descripcion())
    }
}

struct Proyectos : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .foregroundStyle(.white)
            .padding()
            .background(.brown)
            .clipShape(.rect(cornerRadius: 10))
            .textCase(.uppercase)

    }
}
extension View {
    func proyectos() -> some View {
        modifier(Proyectos())
    }
}

struct ImagenPie : ViewModifier {
    var text : String
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing){
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
            
        }
    }
}
extension View {
    func imagenPie(with text: String) -> some View {
        modifier(ImagenPie(text: text))
    }
}
struct ContentView: View {
    var body: some View {
        ZStack{
            Color.gray
                .ignoresSafeArea(edges: .all)
            VStack(spacing : 20){
                HStack(alignment:.center){
                    Text("Presentacion")
                        .titulos()
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 62))
                        
                    
                }
                .padding(.vertical,25)
                
                Text("Me llamo Rafael Peralta y soy un estudiante de SwiftUI")
                    .descripcion()
                Text("Me gusta mucho crear las cosas que me imagino como esta misma presentacion disfruto de aprender cosas nuevas!")
                    .padding()
                    .descripcion()
                
                Text("Las aplicaciones que he creado hasta ahora son: ")
                    .padding(2)
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundStyle(.white)
                VStack(spacing: 5){
                    Text("1. WeSplit")
                    Text("2. Convert")
                    Text("3. Guess the Flag"
                    )
                }
                .proyectos()
                

                Color.white
                    .frame(width: 300, height: 50)
                    .imagenPie(with: "Rafael Peralta iOS Developer")
            }
        }
        
    }
}

#Preview {
    ContentView()
}
