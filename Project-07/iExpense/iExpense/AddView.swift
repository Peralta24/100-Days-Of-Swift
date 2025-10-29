
import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    var gastos : GastosAlmacen
    @State private var nombre = ""
    @State private var cantidad: Double = 0
    @State private var cateogria: String = ""
    
    let tipo = ["Personal","Grupal"]
    var body: some View {
        NavigationStack {
            Form{
                TextField("Nombre",text: $nombre)
                Picker("Tipo", selection: $cateogria){
                    ForEach(tipo, id: \.self){
                        Text("\($0)")
                    }
                }
                TextField("Precio",value: $cantidad,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle(Text("Añadir Gasto"))
            .toolbar{
                Button("Guardar"){
                    let gasto = Gastos(nombre: nombre, categoria: cateogria, cantidad: cantidad)
                    gastos.gastos.append(gasto)
                    dismiss()
                }
            }
        }
    }
}
#Preview {
    AddView(gastos: GastosAlmacen())
}
