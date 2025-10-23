//
//  ContentView.swift
//  Animation
//
//  Created by Jose Rafael Peralta Martinez  on 22/10/25.
//

import SwiftUI
struct CornerRotateModifier : ViewModifier {
    let amount : Double
    let anchor : UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}
extension AnyTransition{
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}
struct ContentView: View {
let letters = Array("Hello, World!")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var isShowingRed = false
    @State private var isShowingText = false
    @State private var isShowingGreen = false
    var body: some View {
        VStack{
            Button("Tap me"){
                withAnimation{
                    isShowingRed.toggle()
                }
            }
            if isShowingRed{
                Rectangle()
                    .fill(.red)
                    .frame(width: 100, height: 100)
                    .transition(.scale)
            }
            
            Button("Press me") {
                withAnimation{
                    isShowingText.toggle()
                }
            }
            
            if isShowingText{
                Text("Hello, World!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .transition(.asymmetric(insertion: .slide, removal: .slide))
            }
        }
        
        HStack(spacing: 0){

            ForEach(0..<letters.count, id: \.self){number in
                    Text(String(letters[number]))
                    .font(.title)
                    .background(enabled ? .red : .blue)
                    .fontWeight(.bold)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(number)/20))

            }
        }
        .gesture(
            DragGesture()
            
                .onChanged{ dragAmount = $0.translation}
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
        
        ZStack{
            Rectangle()
                .fill(.purple)
                .frame(width: 100, height: 100)
            
            if isShowingGreen {
                Rectangle()
                    .fill(.green)
                    .frame(width: 100, height: 100)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation{
                isShowingGreen.toggle()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
