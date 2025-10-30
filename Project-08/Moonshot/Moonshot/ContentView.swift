import SwiftUI
struct Usuario : Codable {
    let nombre : String
    let dirrecion : Direccion
}

struct Direccion : Codable {
    let calle : String
    let ciudad : String
}
struct ContentView: View {
    var body: some View {
        NavigationStack{
            Image(.example)
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.horizontal, alignment: .center){size, axis in
                    size * 0.8
                }
            
            ScrollView {
                LazyVStack {
                    ForEach(0..<100){
                        Text("\($0)")
                    }
                }
            }
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(0..<100){
                        Text("\($0)")
                    }
                }
            }
            NavigationLink{
                Color.black
            } label : {
                VStack{
                    Text("Presioname")
                    Text(":)")
                    Image(systemName: "chevron.right")
                        .font(.title)
                }
            }
            
            List(0..<21){filas in
                NavigationLink("Filas \(filas)"){
                    Text("Detalles")
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
                
                if let usuario = try? decoder.decode(Usuario.self, from: data){
                    print(usuario.dirrecion.ciudad)
                }
                
            }
           
        }
        
    }
}

#Preview {
    ContentView()
}
