import SwiftUI
struct Gasto : Identifiable , Codable{
    var id = UUID()
    let nombre : String
    let categoria: String
    let monto: Double
}

@Observable
class Gastos {
    var index = [Gasto]()
}
struct ContentView: View {
    @State private var gastos = Gastos()
    var gastosPersonales : [Gasto] {
        gastos.index.filter{$0.categoria == "Personal"}
    }
    var gastosNegocios : [Gasto]{
        gastos.index.filter{$0.categoria == "Negocio"}
    }
    @State private var mostrarFormulario = false
    var body: some View {
        NavigationStack{
            List{
                Section("Gastos Personales"){
                    ForEach(gastosPersonales){gasto in
                        HStack{
                            VStack(alignment: .leading){
                                Text(gasto.nombre)
                                    .font(.headline)
                                
                                Text(gasto.categoria)
                            }
                            Spacer()
                            Text(gasto.monto,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
                    }
                    .onDelete(perform: borrarGastoPersonal)
                }
                Section("Gastos Negocios"){
                    ForEach(gastosNegocios) { gasto in
                        HStack{
                            VStack(alignment: .leading){
                                Text(gasto.nombre)
                                    .font(.headline)
                                
                                Text(gasto.categoria)
                            }
                            Spacer()
                            Text(gasto.monto,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
                    }
                    .onDelete(perform: borrarGastoNegocio)
                }
            }
            .navigationTitle("Gastos")
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
    func borrarGastoPersonal(offset:IndexSet){
        let itemsABorrar = offset.map {gastosPersonales[$0]}
        gastos.index.removeAll{gasto in
            itemsABorrar.contains{$0.id == gasto.id}
        }
    }
    func borrarGastoNegocio(offset:IndexSet){
        let itemsABorrar = offset.map {gastosNegocios[$0]}
        gastos.index.removeAll{gasto in
            itemsABorrar.contains{$0.id == gasto.id}
        }
    }
}


#Preview {
    ContentView()
}
