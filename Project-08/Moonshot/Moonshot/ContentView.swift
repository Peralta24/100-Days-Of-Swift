import SwiftUI

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
            }
        }
            
    }
}


#Preview {
    ContentView()
}
