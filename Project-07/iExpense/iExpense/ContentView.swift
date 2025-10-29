

import SwiftUI
struct Gasto: Identifiable, Codable {
    var id = UUID()
    let nombre : String
    let categoria: String
    let cantidad : Double
}

@Observable
class Gastos {
    var indices = [Gasto]()
}
struct ContentView: View {
    @State private var gastos = Gastos()
    var body: some View {
        NavigationStack {
            List{
                ForEach(gastos.indices){gasto in
                    Text(gasto.nombre)
                }
                .onDelete(perform: borrarIndices)
            }
            .navigationTitle(Text("Gastos"))
            .toolbar {
                Button("Agregar gasto",systemImage: "plus"){
                    let gasto = Gasto(nombre: "Gasto 1", categoria: "Alimentación", cantidad: 100.0)
                    gastos.indices.append(gasto)
                }
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
