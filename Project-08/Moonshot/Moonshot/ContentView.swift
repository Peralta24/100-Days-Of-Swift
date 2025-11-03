import SwiftUI

struct Usuario : Codable{
    let name : String
    let address: Address
}

struct Address : Codable{
    let street: String
    let city : String
}
struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack(spacing:20){
                VStack(alignment: .leading){
                    Image(.example)
                        .resizable()
                        .frame(width: 380, height: 200)
                        .scaledToFill()
                }
                VStack(alignment: .leading){
                    NavigationLink("Ir al scroll vertical"){
                        ScrollView{
                            LazyVStack(spacing:20){
                                ForEach(0..<300){num in
                                    Text("Numero \(num)")
                                }
                            }
                        }
                    }
                }
                VStack(alignment: .leading){
                    NavigationLink("Ir al scroll horizontal"){
                        ScrollView(.horizontal){
                            LazyHStack{                            ForEach(0..<300){num in
                                Text("Numero \(num)")
                            }
                            }
                        }
                    }
                }
                VStack(alignment: .leading){
                    NavigationLink("Ir a los mensajes"){
                        List(0..<20){num in
                            NavigationLink("mensaje\(num)"){
                                Text("mnesaje \(num)")
                            }
                        }                    }
                }
                
                VStack{
                    Button("Decode JSON"){
                        let input = """
                                    {
                                    "name": "Taylor Swift",
                                    "address": {
                                        "street": "555, Avenue",
                                        "city": "Nashvile"
                                    } 
                                    }
                                    """
                        
                        let datos = Data(input.utf8)
                        let decoder = JSONDecoder()
                        if let persona = try? decoder.decode(Usuario.self, from: datos){
                            print(persona.name)
                            print(persona.address.city)
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
