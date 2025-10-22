//
//  ContentView.swift
//  Animation
//
//  Created by Jose Rafael Peralta Martinez  on 22/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmoun = 1.0
    var body: some View {
        Button("Tap me"){
                animationAmoun += 0.1
            
        }
            .padding(50)
            .background(animationAmoun > 3 ? Color.green : Color.red)
            .foregroundStyle(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmoun)
            .blur(radius: (animationAmoun - 1) * 3)
            .animation(.default, value: animationAmoun)
    }
}

#Preview {
    ContentView()
}
