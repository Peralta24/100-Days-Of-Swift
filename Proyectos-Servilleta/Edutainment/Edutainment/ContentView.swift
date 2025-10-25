import SwiftUI
struct Pregunta {
    var texto : String
    var respuesta : Int
}
struct ContentView: View {
    @State private var tablaSeleccionada = 2
    @State private var dificultadSeleccionada = 5
    let dificultades = [5, 10, 20]
    @State private var juegoEmpezado = false
    
    
    @State private var preguntas = [Pregunta]()
    @State private var preguntaActual = 0
    @State private var respuestaSeleccionada = ""
    @State private var mensajeResultado = ""
    @State private var puntuacionUsuario = 0
    var body: some View {
        NavigationStack {
            if !juegoEmpezado {
                VStack(spacing:20){
                    Form{
                        Section("Ingresa la tabla que deseas practicar"){
                            Stepper("Tabla de \(tablaSeleccionada)",value: $tablaSeleccionada,in : 2...12)
                        }
                        Section("Ingresa la dificultad"){
                            Picker("Dificultad",selection: $dificultadSeleccionada){
                                ForEach(dificultades, id: \.self){
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                        Section{
                            Button("Empezar a Practicar"){
                                empezarElJuego()
                            }
                        }
                    }
                }
            }else {
                if preguntaActual < preguntas.count {
                    VStack{
                        Form{
                            Section("Pregunta a responder"){
                                Text(preguntas[preguntaActual].texto)
                                TextField("Ingresa tu respuesta",text: $respuestaSeleccionada)
                            }
                            Button("Verificar Respuesta"){
                                verificarRespuesta()
                            }
                            Text(mensajeResultado)
                            Text("Tu puntuacion es \(puntuacionUsuario)")
                        }
                    }
                }else {
                    Text("Juego terminado")
                    Text("Tu puntuacion fue de \(puntuacionUsuario)")
                    Button("Volver a practicar"){
                        resetearJuego()
                    }
                }
            }
        }
    }
    func empezarElJuego(){
        preguntas.removeAll()
        preguntaActual = 0
        mensajeResultado = ""
        puntuacionUsuario = 0
        juegoEmpezado = true
        
        for _ in 1...dificultadSeleccionada {
            let numeroRandom = Int.random(in: 1...12)
            let textoPregunta = "\(tablaSeleccionada) x \(numeroRandom)"
            let respuestaPregunta = tablaSeleccionada * numeroRandom
            preguntas.append(Pregunta(texto: textoPregunta, respuesta: respuestaPregunta))
        }
    }
    
    func verificarRespuesta(){
        var respuestaCorrecta = preguntas[preguntaActual].respuesta
        
        if respuestaSeleccionada == String(respuestaCorrecta){
            mensajeResultado = "Correcto"
            puntuacionUsuario += 1
        }else {
            if puntuacionUsuario > 0 {
                mensajeResultado = "Incorrecto"
                puntuacionUsuario -= 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            mensajeResultado = ""
            preguntaActual += 1
            respuestaSeleccionada = ""
        }
    }
    
    func resetearJuego(){
        juegoEmpezado = false
        respuestaSeleccionada = ""
        puntuacionUsuario = 0
        mensajeResultado = ""
        preguntaActual = 0
        preguntas.removeAll()
    }
}

#Preview {
    ContentView()
}
