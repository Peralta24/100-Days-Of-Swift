//
//  ContentView.swift
//  Animation
//
//  Created by Jose Rafael Peralta Martinez  on 22/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmoun = 0.0
    var body: some View {
        
        
        Button("Tap me"){
            withAnimation(.spring(duration:1 ,bounce:   0.3)){
                animationAmoun += 320
            }
        }
        .padding(30)
        .background(Color.red)
        .foregroundStyle(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmoun), axis: (x: 1, y:0, z: 0))
        
        
    }
}

#Preview {
    ContentView()
}
