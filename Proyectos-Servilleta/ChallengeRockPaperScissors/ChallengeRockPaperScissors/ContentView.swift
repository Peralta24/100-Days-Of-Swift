import SwiftUI

struct ContentView: View {
    
    @State private var opcionesMaquina = ["Piedra", "Papel", "Tijera"]
    @State private var opcionesGanadoras = ["Papel", "Tijeras", "Piedra"]
    @State private var opcionElegida = Int.random(in: 0...2)
    @State private var opcionElegidaUsuario = ""
    @State private var jugadorEstado = Bool.random()
    @State private var totalPreguntas = 10
    @State private var puntuacionUsuario = 0
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("La maquina escogio: ")
                    Text(opcionesMaquina[opcionElegida])
                    Text("En esta ronda \(jugadorEstado ? "Ganas" : "Pierdes")")
                }
                .padding()
                
                HStack {
                    ForEach(opcionesMaquina, id: \.self) { num in
                        Button {
                            verificarRespuesta(num)
                        } label: {
                            Text(num)
                        }
                    }
                }
                .padding()
                
                VStack {
                    Text("Preguntas restantes: \(totalPreguntas)")
                    Text("Tu puntuacion: \(puntuacionUsuario)")
                }
            }
        }
    }
    
    func verificarRespuesta(_ respuesta: String) {
        opcionElegidaUsuario = respuesta
        
        // Opción de la máquina actual
        let eleccionMaquina = opcionesMaquina[opcionElegida]
        
        var jugadorGana = false
        
        if (respuesta == "Piedra" && eleccionMaquina == "Tijera") ||
            (respuesta == "Papel" && eleccionMaquina == "Piedra") ||
            (respuesta == "Tijera" && eleccionMaquina == "Papel") {
            jugadorGana = true
        }
        
        // Si la instrucción era "Ganar" y el jugador gana, suma punto.
        // O si la instrucción era "Perder" y el jugador pierde.
        if (jugadorEstado && jugadorGana) || (!jugadorEstado && !jugadorGana) {
            puntuacionUsuario += 1
        }
        
        // Pasamos a la siguiente ronda
        opcionElegida = Int.random(in: 0...2)
        jugadorEstado.toggle()
        totalPreguntas -= 1
    }
}

#Preview {
    ContentView()
}
