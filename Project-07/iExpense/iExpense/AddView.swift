import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    var gasto: Gastos // Correcto, recibe la lista principal
    
    @State private var nombre = ""
    
    // 1. DALE UN VALOR INICIAL VÁLIDO
    // Así el Picker empieza seleccionando "Personal" por defecto
    @State private var categoria = "Personal"
    
    @State private var monto: Double = 0
    
    let categoias = [
        "Personal",
        "Negocios"
    ]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Nombre", text: $nombre)
                
                Picker("Tipo", selection: $categoria) {
                    ForEach(categoias, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Precio", value: $monto, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle(Text("Agregar Gasto"))
            .toolbar {
                Button("Guardar") {
                    let gastoNuevo = Gasto(nombre: nombre, categoria: categoria, cantidad: monto)
                    gasto.indices.append(gastoNuevo)
                    
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(gasto: Gastos())
}
