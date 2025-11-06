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

    let mockAstronaut = Astronaut(id: "armstrong",
                                 name: "Neil A. Armstrong",
                                 description: "Un astronauta de prueba.")

    let mockCrew = [
        CrewMember(role: "Comandante", astronaut: mockAstronaut),
        CrewMember(role: "Piloto", astronaut: mockAstronaut)
    ]

    return ScrollViewChildren(crew: mockCrew)
        .background(.darkBackground)
}
