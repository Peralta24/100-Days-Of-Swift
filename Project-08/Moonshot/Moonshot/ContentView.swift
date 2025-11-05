import SwiftUI

struct ContentView: View {
    @State private var cambiarVista = "List"
    @State private var cambiarVistaCondicion = false
    let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    let missions : [Mission] = Bundle.main.decode("missions.json")
    let columns = [
        GridItem(.adaptive(minimum: 150, maximum: 300))
    ]
    
    var body: some View {
        NavigationStack {
            
            Group {
                if !cambiarVistaCondicion {
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(missions) { mission in
                                NavigationLink {
                                    MissionView(mission: mission, astronauts: astronauts)
                                } label : {
                                    MissionCellView(mission: mission)
                                }
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                    .background(.darkBackground)

                } else {
                    List(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label : {
                            MissionCellView(mission: mission)
                        }
                        .listRowBackground(Color.darkBackground)
                        .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .background(.darkBackground)
                }
            }             .navigationTitle("Moonshot")
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    cambiarVistaCondicion.toggle()
                    cambiarVista = cambiarVistaCondicion ? "Grid" : "List"
                } label : {
                    Text(cambiarVista)
                }
            }
        }
    }
}



