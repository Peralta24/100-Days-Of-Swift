//
//  ContentView.swift
//  BookWorm
//
//  Created by Jose Rafael Peralta Martinez  on 25/11/25.
//

import SwiftUI
struct ButtonConfirm : View {
    var title: String
    @Binding var isOn : Bool
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
    }
}
struct ContentView : View {
    @State var isPresented = false
    @AppStorage("notes") var notes = ""
    var body: some View {
        NavigationStack {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
        }
    }
}

#Preview {
    ContentView()
}
