import SwiftUI
struct NombresE : ViewModifier  {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15))
            .foregroundColor(.blue)
    }
}
extension View {
    func nombres() -> some View {
        modifier(NombresE())
    }
}
struct Nombres  {
    var nombre : String
    var apellido : String
}
@Observable
class Contador {
    var contador = 0
    
    func aumentarContador(){
        contador += 1
    }
    func disminuirContador(){
        contador -= 1
    }
}

struct SegundaSeccion: View {
    var nombre : String
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Text("Segunda Sección")
        Text("Tu grupo favorito es \(nombre)")
        Button("Salir"){
            dismiss()
        }
    }
}
struct ContentView: View {
    
    @State private var xana = Nombres(nombre: "Xana", apellido: "Valderrabano")
    @State private var rafael = Nombres(nombre: "Rafael", apellido: "Peralta")
    
    @State private var contador = Contador()
    
    @State private var segundaSeccion = false
    
    @State private var numeros = [Int]()
    @State private var numeroActual = 1
    
    @State private var aplicaciones = [String]()
    @State private var aplicacionActual = 1
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "tapCount")
    var body: some View {

        NavigationStack {
            VStack{
                Section("Nombres"){
                    Text("\(xana.nombre) \(xana.apellido)")
                    Text("\(rafael.nombre) \(rafael.apellido)")
                    HStack{
                        TextField("Xana Nombre",text: $xana.nombre)
                        TextField("Xana Apellido",text: $xana.apellido)
                        TextField("Rafael Nombre",text: $rafael.nombre)
                        TextField("Rafael Apellido",text: $rafael.apellido)
                    }
                    .nombres()
                }
                Section("Contador"){
                    Text("Contador en \(contador.contador)")
                    Button("+") {
                        contador.aumentarContador()
                    }
                    Button("-",action: contador.disminuirContador)
                }
                Section("Secciones aparte"){
                    Text("Ir a la segunda seccion click en el boton")
                    Button("Segunda Seccion") {
                        segundaSeccion.toggle()
                    }
                }
                .sheet(isPresented: $segundaSeccion){
                    SegundaSeccion(nombre: "MEOVV")
                }
                
                Section("Listas"){
                    List{
                        ForEach(numeros, id: \.self){
                            Text("\($0)")
                        }
                        .onDelete(perform: borrarNumeros)
                    }
                    Button("Agregar numero"){
                        numeros.append(numeroActual)
                        numeroActual += 1
                    }
                    
                    
                }
                List{
                    ForEach(aplicaciones,id:\.self){
                        Text("\($0)")
                    }
                    .onDelete(perform: borrarApps)
                    
                    Button("Agregar Aplicacion") {
                        aplicaciones.append("Aplicacion: \(aplicacionActual)")
                        aplicacionActual += 1
                    }
                }
                
                Button("Tap Count: \(tapCount)") {
                    UserDefaults.standard.set(tapCount, forKey: "tapCount")
                    tapCount += 1
                }
                Button("Save"){
//                    let encoder = JSONEncoder()
//                    
//                    if let data = try? encoder.encode(rafael){
//                        UserDefaults.standard.set(data, forKey: "rafael")
//                    }
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
    func borrarNumeros(at offsets: IndexSet) {
        numeros.remove(atOffsets: offsets)
    }
    func borrarApps(at offsets: IndexSet){
        aplicaciones.remove(atOffsets: offsets)
    }
}



#Preview {
    ContentView()
}
