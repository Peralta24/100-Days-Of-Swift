
import SwiftUI

//Crear la estructura
struct Gasto : Identifiable, Codable{
    var id =  UUID()
    let nombre : String
    let categoria : String
    let monto : Double
}
//Crear la clase 
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    ContentView()
}
