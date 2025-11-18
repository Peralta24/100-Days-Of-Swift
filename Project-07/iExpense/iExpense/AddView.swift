
import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    var gastos = Gastos()
    @State private var nombre = ""
    @State private var cateogoria = "Personal"
    @State private var monto: Double = 0
    
    let categorias = ["Personal","Negocio"]
    @State private var tituloGasto = "Nombre del gasto"
    var body: some View {
        NavigationStack {
            Form {
                Picker("Categoria",selection: $cateogoria){
                    ForEach(categorias, id:\.self){
                        Text($0)
                    }
                }
                TextField("Cantidad",value: $monto,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
            .navigationTitle($tituloGasto)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button("Guardar"){
                    let nuevoGasto = Gasto(nombre: tituloGasto, categoria: cateogoria, monto: monto)
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
