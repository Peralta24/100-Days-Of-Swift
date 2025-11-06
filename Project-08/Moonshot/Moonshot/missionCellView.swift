//
//  missionCellView.swift
//  Moonshot
//
//  Created by Jose Rafael Peralta Martinez  on 05/11/25.
//

import SwiftUI

struct MissionCellView: View {
    let mission: Mission
    
    var body: some View {
        VStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            VStack {
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundStyle(.white)
                
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.lightBackground)
        } 
        .clipShape(.rect(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
        )
    }
}



