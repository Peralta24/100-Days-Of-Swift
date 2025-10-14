//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jose Rafael Peralta Martinez on 13/10/25.
//

import SwiftUI

// MARK: - Modificadores
let habilidadesAFuturo = ["Aprender SwiftUI","Construir mis propias Aplicaciones", "Construir una pagina web"]
struct Titulos: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .textCase(.uppercase)
    }
}

extension View {
    func titulos() -> some View {
        modifier(Titulos())
    }
}

struct Descripcion: ViewModifier {
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

struct Proyectos: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .foregroundStyle(.white)
            .padding()
            .background(Color.brown)
            .cornerRadius(10)
            .textCase(.uppercase)
    }
}

extension View {
    func proyectos() -> some View {
        modifier(Proyectos())
    }
}

struct ImagenPie: ViewModifier {
    var text: String
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(Color.black)
                .cornerRadius(5)
                .padding(5)
        }
    }
}

extension View {
    func imagenPie(with text: String) -> some View {
        modifier(ImagenPie(text: text))
    }
}

struct FuturoALograr : ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.white)
            .padding()
            .background(Color.black)
            .cornerRadius(10)
    }
}
extension View {
    func futuroALograr() -> some View {
        modifier(FuturoALograr())
    }
}

// MARK: - ContentView

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                HStack(alignment: .center) {
                    Text("Presentación")
                        .titulos()
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 62))
                }
                .padding(.vertical, 25)
                
                Text("Me llamo Rafael Peralta y soy un estudiante de SwiftUI")
                    .descripcion()
                
                Text("Me gusta mucho crear las cosas que me imagino, como esta misma presentación. ¡Disfruto de aprender cosas nuevas!")
                    .descripcion()
                
                Text("Las aplicaciones que he creado hasta ahora son:")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                VStack(spacing: 5) {
                    Text("1. WeSplit")
                    Text("2. Convert")
                    Text("3. Guess the Flag")
                }
                .proyectos()
                
                Color.white
                    .frame(width: 300, height: 50)
                    .imagenPie(with: "Rafael Peralta iOS Developer")
                
                HStack{
                    Text("Metas a largo plazo")
                        .font(.headline)
                        .fontWeight(.bold)
                        
                }
                VStack(alignment: .leading) {
                    ForEach(habilidadesAFuturo,id: \.self){
                        Text("\($0)")
                    }
                }
                .futuroALograr()
            }
            .padding()
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
