//
//  MissionView.swift
//  Moonshot
//
//  Created by Jose Rafael Peralta Martinez  on 04/11/25.
//

import SwiftUI

struct MissionView: View {
    let mission : Mission
    
    
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
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        
                    }
                    .padding(.horizontal)
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
    let missions : [Mission] = Bundle.main.decode("missions.json")
    MissionView(mission: missions[0])
        .preferredColorScheme(.dark)
}
