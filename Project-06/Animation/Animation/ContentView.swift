//
//  ContentView.swift
//  Animation
//
//  Created by Jose Rafael Peralta Martinez  on 22/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = false
    var body: some View {
        
        Button("Enable/Disable"){
            enabled.toggle()
        }
        
        .padding(20)
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(.default,value: enabled)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.9), value: enabled)
        .foregroundStyle(enabled ? .green : .white)
        .animation(.bouncy(duration: 4),value: enabled)


        
    }
}

#Preview {
    ContentView()
}
