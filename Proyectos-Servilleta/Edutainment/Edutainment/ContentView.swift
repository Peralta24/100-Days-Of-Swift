import SwiftUI
struct Pregunta {
    var texto: String
    var respuesta: Int
}

struct Botones : ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.primary)
            .fontWeight(.bold)
            .padding(.horizontal,70)
            .hoverEffect(.highlight)
    }
}
extension View {
    func botones() -> some View {
        modifier(Botones())
    }
}
struct ContentView: View {
    @State private var juegoIniciado = false
    @State private var tablaSeleccionada = 2
    @State private var dificultadSeleccionada = 5
    let dificultades = [5,10,20]
    var tablaMinima = 2
    var tablaMaxima = 12

    // Variables
    @State private var preguntas = [Pregunta]()
    @State private var preguntaActual = 0
    @State private var respuestaActual = ""
    @State private var mensajeResultado = ""
    @State private var puntuacionUsuario = 0
    @State private var mostrarResultado = false
    var body: some View {
        NavigationStack {
            VStack {
                if !juegoIniciado {
                    Form {
                        Section("Selecciona la tabla que quieres practicar!"){
                            Stepper("Tabla del \(tablaSeleccionada)",value: $tablaSeleccionada,in: tablaMinima...tablaMaxima)
                        }
                        Section("Dificultad"){
                            Picker("Selecciona la difultad",selection:$dificultadSeleccionada){
                                ForEach(dificultades, id: \.self){
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(.segmented)
                            
                        }
                        Section{
                            Button{
                                iniciarJuego()
                            }label: {
                                Text("Empezar a Practicar!")
                                    .botones()
                                    
                            }
                        }
                        
                    }
                }else {
                    if preguntaActual < preguntas.count {
                        VStack{
                            Form {
                                Section("Responde la siguiente pregunta:"){
                                    Text(preguntas[preguntaActual].texto)
                                        .font(.title2)
                                        .foregroundStyle(.blue)
                                        .multilineTextAlignment(.center)
                                        .frame(width:400)
                                    TextField("Introduce tu resultado",text:$respuestaActual)
                                }
                                Section{
                                    Button{
                                        validarRespuesta()
                                    }label: {
                                        Text("Validar la respuesta")
                                            .botones()
                                    }
                                }
                                Section{
                                    Text("Puntuacion: \(puntuacionUsuario)")
                                }
                            }
                        }
                    }else {
                        Text("Juego Terminado")
                        Text("Tu puntuación final es: \(puntuacionUsuario)")
                        Button{
                            reiniciarJuego()
                        }label: {
                            Text("Volver a practicar")
                                .botones()
                        }
                    }
                }
            }
            .navigationTitle("Multiplicaciones")
        }
        .alert(mensajeResultado,isPresented: $mostrarResultado){
            Button("Ok"){
                
            }
        }
    }
    
    //MARK: EMPEZAR A CREAR LA LOGICA DEL JUEGO
    
    func iniciarJuego(){
        preguntas.removeAll()
        preguntaActual = 0
        respuestaActual = ""
        mensajeResultado = ""
        puntuacionUsuario = 0
        juegoIniciado = true
        
        for _ in 0..<dificultadSeleccionada{
            let numeroAleatorio = Int.random(in: 1...12)
            let preguntaTexto = "\(tablaSeleccionada) x \(numeroAleatorio)"
            let respuestaCorrecta = tablaSeleccionada * numeroAleatorio
            preguntas.append(Pregunta(texto: preguntaTexto, respuesta: respuestaCorrecta))
        }
    }
    
    func validarRespuesta(){
        let respuestaCorrecta = preguntas[preguntaActual].respuesta
        
        if respuestaActual == String(respuestaCorrecta){
            mensajeResultado = "Correcto, sigue asi!"
            puntuacionUsuario += 1
        }else {
            mensajeResultado = "Incorrecto, sigue practicando!"
            if puntuacionUsuario > 0{
                puntuacionUsuario -= 1
            }
        
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            mensajeResultado = ""
            respuestaActual = ""
            preguntaActual += 1
            mostrarResultado = false

        }
        mostrarResultado = true
        
    }
    
    func reiniciarJuego(){
        juegoIniciado = false
        puntuacionUsuario = 0
        preguntaActual = 0
        preguntas.removeAll()
        mensajeResultado = ""
        respuestaActual = ""
    }
}
#Preview {
    ContentView()
}
