
import SwiftUI

//Crear la estructura
struct Gasto : Identifiable, Codable{
    var id =  UUID()
    let nombre : String
    let categoria : String
    let monto : Double
}
//Crear la clase
@Observable
class Gastos{
    var index = [Gasto]()
}
struct ContentView: View {
    @State private var gastos = Gastos()
    var gastosPersonales : [Gasto] {
        gastos.index.filter{$0.categoria == "Personal"}
    }
    var gastosNegocios : [Gasto] {
        gastos.index.filter{$0.categoria == "Negocio"}
    }
    @State private var mostrarAgregar = false
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
                            Text(gasto.monto.formatted())
                                .foregroundStyle(gasto.monto < 10 ? .green : gasto.monto < 100 ? .yellow : .red)
                        }
                    }
                    .onDelete(perform: borrarGastosPersonal)
                }
                Section("Gastos Negocios"){
                    ForEach(gastosNegocios){gasto in
                        HStack{
                            VStack(alignment: .leading){
                                Text(gasto.nombre)
                                    .font(.headline)
                                
                                Text(gasto.categoria)
                            }
                            Spacer()
                            Text(gasto.monto.formatted())
                                .foregroundStyle(gasto.monto < 10 ? .green : gasto.monto < 100 ? .yellow : .red)
                        }
                    }
                    .onDelete(perform: borrarGastosNegocio)
                }
            }
            .navigationTitle(Text("Gastos"))
            .toolbar{
                Button("Agregar",systemImage: "plus"){
                    mostrarAgregar = true
                }
            }
            .sheet(isPresented: $mostrarAgregar){
                AddView(gastos: gastos)
            }
        }
    }
    func borrarGastosPersonal(offset: IndexSet) {
        // Obtén los elementos personales actuales
        let personales = gastos.index.enumerated().filter { $0.element.categoria == "Personal" }
        
        // Convierte los índices de gastosPersonales en índices del arreglo original
        let indicesAEliminar = offset.map { personales[$0].offset }
        
        // Borra esos elementos del arreglo original
        gastos.index.remove(atOffsets: IndexSet(indicesAEliminar))
    }
    func borrarGastosNegocio(offset: IndexSet) {
        let negocios = gastos.index.enumerated().filter { $0.element.categoria == "Negocio" }
        
        let indicesAEliminar = offset.map { negocios[$0].offset }
        
        gastos.index.remove(atOffsets: IndexSet(indicesAEliminar))
    }
}

#Preview {
    ContentView()
}
