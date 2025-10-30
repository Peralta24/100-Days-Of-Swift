import SwiftUI

struct ContentView: View {
    var body: some View {
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
        
    }
}

#Preview {
    ContentView()
}
