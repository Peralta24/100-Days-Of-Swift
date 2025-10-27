import SwiftUI

struct Nombre {
    var nombre : String
    var apellido : String
}
@Observable
class Contador {
    var contador = 0
    
    func aumentar(){
        contador += 1
    }
    func disminuir(){
        contador -= 1
    }
}
struct SeccionDos: View {
    var nombre : String
    @Environment(\.dismiss)  var dismiss
    var body: some View {
        Text("Seccion Dos bienvenido \(nombre)")
        
        Button("Salir de la seccion"){
            dismiss()
        }
    }
}
struct ContentView: View {
    @State private var appsMovil = UserDefaults.standard.value(forKey: "appsMovil") as? [String] ?? []
    @AppStorage("taps") private var tapCounts = 0
    @State private var rafael = Nombre(nombre: "rafael", apellido: "gonzalez")
    @State private var contador = Contador()
    @State private var appActual = 1
    @State private var mostrarSeccionDos = false
    @State private var numerosAlmacenados = [Int]()
    @State private var numeroActual = 1
    var body: some View {
        NavigationStack{
            Section{
                List {
                    ForEach(appsMovil,id: \.self){
                        Text("\($0) number \(self.appActual)")
                    }
                    .onDelete(perform: deleteAps)
                }
                Button("Apps: \(appsMovil.count)") {
                    appsMovil.append("App")
                    appActual += 1
                    UserDefaults.standard.set(appsMovil, forKey: "appsMovil")
                }
            }
            
            Section{
                Button("Tap Count \(tapCounts)"){
                    tapCounts += 1
                }
            }
            List{
                ForEach(numerosAlmacenados,id: \.self){
                    Text("\($0)")
                }
            }
            Button("Agregar numero"){
                numerosAlmacenados.append(numeroActual)
                numeroActual += 1
            }
            
            Section{
                Text("\(rafael.nombre) \(rafael.apellido)")
                TextField("Nombre", text: $rafael.nombre)
                TextField("Apellido",text: $rafael.apellido)
                
                Text("Contador \(contador.contador)")
                Button("Aumentar Contador"){
                    contador.aumentar()
                }
                Button("Disminuir contador"){
                    contador.disminuir()
                }
            }
            
            Button("Ir a la segunda seccion"){
                mostrarSeccionDos.toggle()
            }
            .sheet(isPresented: $mostrarSeccionDos){
                SeccionDos(nombre: "Rafael")
            }
            .toolbar{
                EditButton()
            }
        }

    }
    
    func deleteAps(at offsets: IndexSet) {
        appsMovil.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
