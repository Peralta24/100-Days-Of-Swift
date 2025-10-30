import SwiftUI

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
        }
        
    }
}

#Preview {
    ContentView()
}
