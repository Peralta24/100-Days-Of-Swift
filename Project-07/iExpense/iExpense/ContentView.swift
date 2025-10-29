
import SwiftUI
struct Gasto : Identifiable, Codable {
    var id = UUID()
    let nombre : String
    let categoria : String
    let monto : Double
}

@Observable
class Gastos {
    var indices = [Gasto]() {
        didSet{
            if let data = try? JSONEncoder().encode(indices){
                UserDefaults.standard.set(data, forKey: "gastos")
            }
        }
    }
    init() {
        if let data = UserDefaults.standard.data(forKey: "gastos") {
            if let decoded = try? JSONDecoder().decode([Gasto].self, from: data) {
                indices = decoded
                return
            }
        }
        indices = []
    }

}
struct ContentView: View {
    @State private var gastos = Gastos()
    var gastosPersonales : [Gasto] {
        gastos.indices.filter{$0.categoria == "Personal"}
    }
    var gastosNegocios : [Gasto] {
        gastos.indices.filter{$0.categoria == "Negocio"}
    }
    @State private var mostrarFormulario = false
    var body: some View {
        NavigationStack{
            List{
                Section("Gastos personales"){
                    ForEach(gastosPersonales){gasto in
                        Text(gasto.nombre)
                    }
                    .onDelete(perform: borrarGastosPersonal)
                }
                Section("Gastos Negocios"){
                    ForEach(gastosNegocios){gastos in
                        Text(gastos.nombre)
                    }
                    .onDelete(perform: borrarGastosNegocio)
                }
            }
            .navigationTitle(Text("Gastos"))
            .toolbar{
                Button("Agregar",systemImage: "plus"){
                    mostrarFormulario = true
                }
            }
            .sheet(isPresented: $mostrarFormulario){
                AddView(gastos: gastos)
            }
        }
    }
    func borrarGastosPersonal(offset: IndexSet) {
        let personales = gastos.indices.enumerated().filter { $0.element.categoria == "Personal" }
        
        let indicesAEliminar = offset.map { personales[$0].offset }
        
        gastos.indices.remove(atOffsets: IndexSet(indicesAEliminar))
    }
    func borrarGastosNegocio(offset: IndexSet) {
        let negocios = gastos.indices.enumerated().filter { $0.element.categoria == "Negocio" }
        
        let indicesAEliminar = offset.map { negocios[$0].offset }
        
        gastos.indices.remove(atOffsets: IndexSet(indicesAEliminar))
    }

}

#Preview {
    ContentView()
}
