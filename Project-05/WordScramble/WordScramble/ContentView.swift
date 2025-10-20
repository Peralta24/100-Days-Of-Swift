//
//  ContentView.swift
//  WordScramble
//
//  Created by Jose Rafael Peralta Martinez  on 20/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
        
}
func getUrl(){
    if let url = Bundle.main.url(forResource: "images", withExtension: "jpg")
        if let content = try? String(contentsOf: url){
        //We loades the file in to a string
    }
        
}
#Preview {
    ContentView()
}

