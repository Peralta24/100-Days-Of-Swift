//
//  ScrollViewChildren.swift
//  Moonshot
//
//  Created by Jose Rafael Peralta Martinez  on 05/11/25.
//

// ScrollViewChildren.swift
import SwiftUI

struct ScrollViewChildren: View {
        let crew: [CrewMember]
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )

                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    // 1. Creamos un astronauta de mentira (mock)
    // (Asegúrate que las propiedades coincidan con tu struct Astronaut)
    let mockAstronaut = Astronaut(id: "armstrong",
                                 name: "Neil A. Armstrong",
                                 description: "Un astronauta de prueba.")

    // 2. Creamos una tripulación de mentira usando el astronauta
    let mockCrew = [
        CrewMember(role: "Comandante", astronaut: mockAstronaut),
        CrewMember(role: "Piloto", astronaut: mockAstronaut)
    ]

    // 3. Le pasamos el array 'mock' a la vista
    return ScrollViewChildren(crew: mockCrew)
        // 4. Añadimos el fondo para que se vea bien
        .background(.darkBackground)
}
