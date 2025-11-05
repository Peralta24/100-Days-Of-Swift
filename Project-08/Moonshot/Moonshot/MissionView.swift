//
//  MissionView.swift
//  Moonshot
//
//  Created by Jose Rafael Peralta Martinez  on 04/11/25.
//

import SwiftUI

struct CrewMember {
    let role : String
    let astronaut : Astronaut
}

struct MissionView: View {
        let mission: Mission
        let crew: [CrewMember]

        init(mission: Mission, astronauts: [String: Astronaut]) {
            self.mission = mission
            
            self.crew = mission.crew.map { member in
                if let astronaut = astronauts[member.name] {
                    return CrewMember(role: member.role, astronaut: astronaut)
                } else {
                    fatalError("Missing \(member.name)")
                }
            }
        }
    
    
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                VStack() {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal){width, axis in
                            width * 0.6
                        }
                    
                    VStack(alignment: .leading){
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundStyle( .lightBackground)
                            .padding(.vertical)

                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                            .padding(.horizontal)
                        Text("Date of Launch: \(mission.formattedLaunchDate)")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .padding([.horizontal, .bottom])
                        Text(mission.description)
                            .padding(.horizontal)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundStyle( .lightBackground)
                            .padding(.vertical)
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                            .padding(.horizontal)
                            
                    }
                    .foregroundStyle(.white)
                    ScrollViewChildren(crew: self.crew)

                    
                }
                .padding(.bottom)
            }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
            
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    return MissionView(mission: missions[0], astronauts: astronauts)
        .background(.darkBackground)
}

