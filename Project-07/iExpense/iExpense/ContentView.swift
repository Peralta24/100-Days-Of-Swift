import SwiftUI

struct Gastos: Identifiable, Codable {
    var id = UUID()
    let nombre : String
    let categoria : String
    let cantidad : Double
}
@Observable
class GastosAlmacen {
    var gastos = [Gastos]() {
        didSet {
            if let encode = try? JSONEncoder().encode(gastos) {
                UserDefaults.standard.set(encode, forKey: "gastos")
            }
        }
    }
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "gastos") {
            if let decoded = try? JSONDecoder().decode([Gastos].self, from: savedItems) {
                gastos = decoded
                return
            }
        }
        gastos = []
    }
}
struct ContentView: View {
    @State private var gastosAlmacenados = GastosAlmacen()

    @State private var mostrarFormulario = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(gastosAlmacenados.gastos){gasto in
                    HStack{
                        VStack(alignment: .leading){
                            Text(gasto.nombre)
                                .font(.headline)
                            
                            Text(gasto.categoria)
                        }
                        Spacer()
                        Text(gasto.cantidad.formatted())
                    }
                }
                .onDelete(perform: eliminarGasto)
            }
            .navigationTitle(Text("Gastos"))
            .toolbar{
                Button("Agregar gasto",systemImage: "plus"){
                    mostrarFormulario = true
                }
            }
            .sheet(isPresented: $mostrarFormulario){
                AddView(gastos: gastosAlmacenados)
            }
        }
       
        
    }
func eliminarGasto(at indexSet: IndexSet){
        gastosAlmacenados.gastos.remove(atOffsets: indexSet)
    }
}

#Preview {
    ContentView()
}

