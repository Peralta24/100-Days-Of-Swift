//
//  ContentView.swift
//  Moonshot
//
//  Created by Jose Rafael Peralta Martinez  on 30/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(.example)
            .resizable()
            .scaledToFit()
            .containerRelativeFrame(.horizontal){size,axis in
                size * 0.8
            }
    }
}

#Preview {
    ContentView()
}
