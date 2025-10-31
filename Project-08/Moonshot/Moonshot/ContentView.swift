import SwiftUI

struct Usuarios : Codable {
    let name : String
    let address: Address
}

struct Address : Codable {
    let street : String
    let city : String
}
struct ContentView: View {
    let frame = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        NavigationStack {
            
            VStack {
                Image(.example)
                    .resizable()
                    .scaledToFit()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .scaledToFit()
                
            }
            .navigationTitle(Text("Example"))
            VStack{
                NavigationLink("Scroll Vertical") {
                    ScrollView{
                            LazyVStack{
                                ForEach(0..<100){numero in
                                    Text("\(numero)")
                            }
                        }
                    }
                }
                NavigationLink("Scroll Horizontal"){
                    ScrollView(.horizontal){
                        LazyHStack{
                            ForEach(0..<100){numero in
                                Text("\(numero)")
                            }
                        }
                    }
                }
                NavigationLink{
                    Text("Bienvenido")
                }label:{
                    Text("Presioname")
                }
                
                NavigationLink("Vista de mensajes"){
                    List(0..<21){fila in
                        NavigationLink("Filas \(fila)"){
                            Text("Detalles")
                        }
                    }
                }
                NavigationLink("Vista de distintas Opciones"){
                    List(0..<30){fila in
                        NavigationLink("Opcion \(fila)"){
                            Text("Detalle opcion \(fila)")
                        }
                    }
                }
                
                Button("Decode JSON"){
                    let input = """
                                                    {
                                                        "name": "Taylor Swift",
                                                        "address": {
                                                            "street": "555, Taylor Swift Avenue",
                                                            "city": "Nashville"
                                                        }
                                                    }
                                                    """
                    
                    let data = Data(input.utf8)
                    if let datos = try? JSONDecoder().decode(Usuarios.self, from: data){
                        print(datos.address.city)
                        print(datos.name)
                        
                    }
                    
                    
                    
                }
                
                NavigationLink("Vista de grid vertical"){
                    ScrollView{
                        LazyVGrid(columns: frame){
                            ForEach(0..<200){numero in
                                Text("\(numero)")
                            }
                        }
                    }
                }
                NavigationLink("Vista de grid horizontal"){
                    ScrollView(.horizontal){
                        LazyHGrid(rows: frame){
                            ForEach(0..<200){numero in
                                Text("\(numero)")
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
