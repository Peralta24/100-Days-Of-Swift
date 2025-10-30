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
    let layout = [
        GridItem(.adaptive(minimum: 100))
    ]
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
                if let user = try? decoder.decode(User.self, from: data){
                    print(user.name)
                    print(user.address.city)
                }
            }
            
            ScrollView{
                LazyVGrid(columns: layout){
                    ForEach(0..<20){item in
                        Text("Item \(item)")
                    }
                }
            }
            ScrollView(.horizontal){
                LazyHGrid(rows: layout){
                    ForEach(0..<20){item in
                        Text("Item \(item)")
                    }
                }
            }
           
        }
        
    }
}

#Preview {
    ContentView()
}
