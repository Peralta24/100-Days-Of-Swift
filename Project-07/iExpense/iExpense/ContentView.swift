

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
    var body: some View {
        NavigationStack {
            List{
                ForEach(gastos.indices){gasto in
                    HStack{
                        VStack(alignment: .leading){
                            Text(gasto.nombre)
                                .font(.headline)
                            
                            Text(gasto.categoria)
                        }
                        Spacer()
                        Text(gasto.cantidad,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                }
                .onDelete(perform: borrarIndices)
            }
            .navigationTitle(Text("Gastos"))
            .toolbar {
                Button("Agregar gasto",systemImage: "plus"){
                    mostrarFormulario = true
                }
            }
            .sheet(isPresented: $mostrarFormulario){
                AddView(gasto: gastos)
            }
        }
        
    }
    func borrarIndices(offset: IndexSet){
        gastos.indices.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
