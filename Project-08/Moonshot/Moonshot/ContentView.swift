
import SwiftUI
struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}


struct ContentView: View {
    var layout = [
        GridItem(.adaptive(minimum: 100, maximum: 120))
    ]
    var mensajes = 10
    var body: some View {
        NavigationStack {
            
            Image(.example)
                .resizable()
                .scaledToFit()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .navigationTitle(Text("Example Image"))
            VStack {
                NavigationLink("Ir a la pagina de listView"){
                    ScrollView{
                        LazyVStack{
                            ForEach(0..<40){num in
                                Text("\(num)")
                            }
                        }
                    }
                    
                }
                NavigationLink("Ir a la seccion de las columnas"){
                    ScrollView{
                        LazyVGrid(columns: layout){
                            ForEach(0..<1000){num in
                                Text("\(num)")
                            }
                        }
                    }
                }
                NavigationLink("Ir a la seccion de filas"){
                    ScrollView(.horizontal){
                        LazyHGrid(rows: layout){
                            ForEach(0..<1000){num in
                                Text("\(num)")
                            }
                        }
                    }
                }
                NavigationLink("Ir a la pagina de HStack"){
                    ScrollView(.horizontal){
                        LazyHStack{
                            ForEach(0..<40){num in
                                Text("\(num)")
                            }
                        }
                    }
                }
                NavigationLink{
                    Text("Presionaste")
                }label: {
                    Text(Image.init(systemName: "plus"))
                    Text("Aquí")
                }
                
                NavigationLink("Opcion seleccion multiple"){
                    List(0..<21){ fila in
                        NavigationLink("Filas \(fila)"){
                            Text("Detalles")
                        }
                        
                    }
                }
                NavigationLink("Opciones de mensajes"){
                    List(1..<mensajes){ mensaje in
                        NavigationLink("Mensaje: \(mensaje)"){
                            Text("Mensaje: \(mensaje)")
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
                                let decoder = JSONDecoder()
                                if let user = try? decoder.decode(User.self, from: data){
                                    print(user.name)
                                    print(user.address.city)
                                }
                            }            }
        }
        
    }
}
#Preview {
    ContentView()
}
