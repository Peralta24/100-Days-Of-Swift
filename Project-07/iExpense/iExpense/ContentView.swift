import SwiftUI
import SwiftData
@Model
class Gasto {
    var id = UUID()
    var nombre : String
    var categoria: String
    var monto: Double
    init(id: UUID = UUID(), nombre: String, categoria: String, monto: Double) {
        self.id = id
        self.nombre = nombre
        self.categoria = categoria
        self.monto = monto
    }
}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext

    @Query(sort: \Gasto.nombre) var gastos: [Gasto]

    @State private var categoriaSeleccionada = "Personal"

    var gastosFiltrados: [Gasto] {
        if categoriaSeleccionada == "Todos" {
            return gastos
        }else {
                return gastos.filter { $0.categoria == categoriaSeleccionada }
        }
    }

    var body: some View {
        NavigationStack {
            List {
                Section("Gastos \(categoriaSeleccionada)") {
                    ForEach(gastosFiltrados) { gasto in
                        fila(gasto)
                    }
                    .onDelete { indexSet in
                        borrar(indexSet, en: gastosFiltrados)
                    }
                }
            }
            .navigationTitle("Gastos")
            .toolbar {
                NavigationLink("Agregar") {
                    AddView(orderCategori: categoriaSeleccionada, sortOrder: [])
                }

                Menu("Filtrar") {
                    Button("Personal") { categoriaSeleccionada = "Personal" }
                    Button("Negocio") { categoriaSeleccionada = "Negocio" }
                    Button("Todos") { categoriaSeleccionada = "Todos" }

                }
            }
        }
    }

    func fila(_ gasto: Gasto) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(gasto.nombre).font(.headline)
                Text(gasto.categoria)
            }
            Spacer()
            Text(gasto.monto, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
        }
    }

    func borrar(_ offset: IndexSet, en lista: [Gasto]) {
        for index in offset {
            modelContext.delete(lista[index])
        }
    }
}



#Preview {
    ContentView()
}
