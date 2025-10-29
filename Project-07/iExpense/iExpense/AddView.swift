
import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    var gastos = Gastos()
    
    @State private var nombre = ""
    @State private var categoria = "Personal"
    @State private var cantidad = 0.0
    let categorias = ["Personal", "Negocio"]
    var body: some View {
        NavigationStack {
            Form{
                TextField("Nombre", text: $nombre)
                Picker("Categoría", selection: $categoria) {
                    ForEach(categorias, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Cantidad", value: $cantidad, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
            .navigationTitle(Text("Añadir Gasto"))
            .toolbar {
                Button("Guardar"){
                    let nuevoGasto = Gasto(nombre: nombre, categoria: categoria, monto: cantidad)
                    gastos.index.append(nuevoGasto)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView()
}
