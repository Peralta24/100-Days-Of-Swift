
import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    var gastos = Gastos()
    
    @State private var nombre = ""
    @State private var categoria = "Personal"
    @State private var monto: Double = 0
    
    let categorias = ["Personal","Negocio"]
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Nombre", text: $nombre)
                Picker("Categoria",selection: $categoria){
                    ForEach(categorias, id: \.self){
                        Text($0)
                    }
                }
                TextField("Monto",value: $monto,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
            .navigationTitle(Text("Agregar Gasto"))
            .toolbar{
                Button("Guardar"){
                    let nuevoGasto = Gasto(nombre: nombre, categoria: categoria, monto: monto)
                    gastos.indices.append(nuevoGasto)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView()
}
