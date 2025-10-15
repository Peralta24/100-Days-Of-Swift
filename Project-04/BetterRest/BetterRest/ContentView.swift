import SwiftUI

struct Subtitulos : ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .font(.subheadline) // Un poco más pequeño para subtítulos
            .fontWeight(.bold)
    }
}

extension View {
    func subtitulos() -> some View {
        modifier(Subtitulos())
    }
}

struct ContentView: View {
    @State private var horasDeSueno = 8.0
    @State private var horaDespertar = Date.now
    @State private var tazasDeCafe = 1

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.black, .gray], startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
                
                
                Form {
                    Section {
                        Text("¿Cuántas horas quieres dormir?")
                            .font(.headline)
                        Stepper("\(horasDeSueno.formatted()) horas", value: $horasDeSueno, in: 4...12, step: 0.25)
                            .foregroundStyle(horasDeSueno < 7 || horasDeSueno > 9 ? .red : .primary)
                    }
                    
                    Section {
                        Text("¿Cuándo quieres despertar?")
                            .font(.headline)
                        DatePicker("Selecciona una hora", selection: $horaDespertar, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }
                    
                    Section {
                        Text("¿Cuántas tazas de café tomas?")
                            .font(.headline)
                        
                        
                        Stepper("^[\(tazasDeCafe) taza](inflect: true)", value: $tazasDeCafe, in: 0...10)
                    }
                    
                    
                    Section("Tu puntaje de descanso es:") {
                        Text("\(calcularPuntajeDescanso().formatted())")
                            .font(.largeTitle.bold())
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(puntajeColor())
                    }
                }
                .scrollContentBackground(.hidden)
                .foregroundColor(.white)
                
            }
            .navigationTitle("BetterRest")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("BetterRest").foregroundColor(.white)
                }
            }
        }
    }
    
    func calcularPuntajeDescanso() -> Double {
        if horasDeSueno == 8   {
            return 10.0
        }else if horasDeSueno >= 7 && horasDeSueno <= 9 {
            return 8.0
        } else {
            return 5.0
        }
    }
    
    func puntajeColor() -> Color {
        let puntaje = calcularPuntajeDescanso()
        if puntaje == 10.0 {
            return .green
        } else if puntaje == 8.0 {
            return .yellow
        } else {
            return .red
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
