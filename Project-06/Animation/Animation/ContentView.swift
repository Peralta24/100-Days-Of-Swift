//
//  ContentView.swift
//  Animation
//
//  Created by Jose Rafael Peralta Martinez  on 22/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var dragAmount = CGSize.zero
    var body: some View {
        
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomLeading)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius:  10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged{ dragAmount = $0.translation}
                    .onEnded { _ in
                        withAnimation(.bouncy){
                            dragAmount = .zero }
                    }
            )
        
    }
}

#Preview {
    ContentView()
}
