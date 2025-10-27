import SwiftUI
enum ocupaciones {
    case Programador_iOS
    case Programador_Web
    case Programador_Móvil
}
struct Persona {
    var nombre : String
    var apellido : String
    var edad : Int
    var ocupacion : ocupaciones
}
@Observable
class Persona2 {
    var nombre = "Victor"
    var apeliido = "Ramirez"
}
@Observable
class Contador {
    var contador = 0
    
    func aumentar(){
        contador += 1
    }
    func decrementar(){
        contador -= 1
    }
}
struct SeccionDos : View {
    var nombre : String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Text("Bienvenido a la seccion numero dos \(nombre)")
        Button("Salir"){
            dismiss()
        }
    }
}
struct ContentView: View {
    @State private var rafael = Persona(nombre: "Jose", apellido: "Peralta", edad: 21, ocupacion: .Programador_iOS)
    @State private var contador = Contador()
    
    @State private var victor = Persona2()
    @State private var verSeccionDos = false
    
    @State private var numeros = [Int]()
    @State private var numeroActual = 1
    
    var body: some View {
        NavigationStack{
            
            
            Text("\(rafael.nombre) \(rafael.apellido) \(rafael.edad) \(rafael.ocupacion)")
            TextField("Nombre: ",text: $rafael.nombre)
            TextField("Apellido",text: $rafael.apellido)
            Text("\(victor.nombre) \(victor.apeliido)")
            TextField("Nombre",text: $victor.nombre)
            TextField("Apellido",text: $victor.apeliido)
            
            Text("Contador \(contador.contador)")
            Button("Aumentar Contador") {
                contador.aumentar()
            }
            Button("Restar al contador"){
                contador.decrementar()
            }
            
            Section("Segunda Seccion"){
                Button("Ir a la segunda seccion"){
                    verSeccionDos.toggle()
                }
            }
            .sheet(isPresented: $verSeccionDos){
                SeccionDos(nombre: "Rafael")
            }
            
            List{
                ForEach(numeros, id: \.self){
                    Text("\($0)")
                }
                .onDelete(perform: borrarNumero)
                
            }
            Button("Agregar numero"){
                numeros.append(numeroActual)
                numeroActual += 1
            }
            .toolbar{
                EditButton()
            }
        }
        
    }
    func borrarNumero(offset: IndexSet){
        numeros.remove(atOffsets: offset)
    }
    
}

#Preview {
    ContentView()
}
