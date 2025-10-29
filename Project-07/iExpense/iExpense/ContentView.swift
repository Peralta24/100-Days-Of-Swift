import SwiftUI

struct Gasto: Identifiable, Codable {
    var id = UUID()
    let nombre : String
    let categoria: String
    let cantidad : Double
}

@Observable
class Gastos {
    var indices = [Gasto]() {
        didSet {
            if let encodes = try? JSONEncoder().encode(indices) {
                UserDefaults.standard.set(encodes, forKey: "gastos")
            }
        }
    }
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "gastos") {
            if let decode = try? JSONDecoder().decode([Gasto].self, from: savedItems) {
                indices = decode
                return
            }
        }
        indices = []
    }
}

struct ContentView: View {
    @State private var gastos = Gastos()
    @State private var mostrarFormulario = false
    
    var gastosPersonales: [Gasto] {
        gastos.indices.filter { $0.categoria == "Personal" }
    }
    
    var gastosNegocios: [Gasto] {
        gastos.indices.filter { $0.categoria == "Negocios" }
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section("Gastos Personales") {
                    ForEach(gastosPersonales) { gasto in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(gasto.nombre)
                                Text(gasto.categoria)
                            }
                            Spacer()
                            Text(gasto.cantidad.formatted())
                                .foregroundStyle(colorParaCantidad(gasto.cantidad))
                        }
                    }
                    .onDelete(perform: borrarIndicesPersonales)
                }
                
                Section("Gastos Empresariales") {
                    ForEach(gastosNegocios) { gasto in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(gasto.nombre)
                                Text(gasto.categoria)
                            }
                            Spacer()
                            Text(gasto.cantidad.formatted())
                                // 2. Llama a la nueva función aquí también
                                .foregroundStyle(colorParaCantidad(gasto.cantidad))
                        }
                    }
                    .onDelete(perform: borrarIndicesNegocios)
                }
            }
            .navigationTitle(Text("Gastos"))
            .toolbar {
                Button("Agregar gasto", systemImage: "plus") {
                    mostrarFormulario = true
                }
            }
            .sheet(isPresented: $mostrarFormulario) {
                AddView(gasto: gastos)
            }
        }
    }
    
    func colorParaCantidad(_ cantidad: Double) -> Color {
        if cantidad < 10 {
            return .green
        } else if cantidad < 100 {
            return .yellow
        } else {
            return .red
        }
    }
    
    func borrarIndicesPersonales(offset: IndexSet) {
        let itemsABorrar = offset.map { gastosPersonales[$0] }
        
        gastos.indices.removeAll { gasto in
            itemsABorrar.contains { $0.id == gasto.id }
        }
    }
    
    func borrarIndicesNegocios(offset: IndexSet) {
        let itemsABorrar = offset.map { gastosNegocios[$0] }
        
        gastos.indices.removeAll { gasto in
            itemsABorrar.contains { $0.id == gasto.id }
        }
    }
}

#Preview {
    ContentView()
}
