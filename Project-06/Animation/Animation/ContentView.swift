//
//  ContentView.swift
//  Animation
//
//  Created by Jose Rafael Peralta Martinez  on 22/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmoun = 1.0
    @State private var animation2 = 1.0
    @State private var cupsOfTee = 1.0
    var body: some View {
        
        VStack{
            Text("Hello, World!")
            Stepper("How many tee\(cupsOfTee)",value: $cupsOfTee.animation(), in: 0...5,step: 2)
            
            Button("\(Image(systemName: "tree"))"){
                cupsOfTee += 0.2
            }
            .padding(2)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(Circle())
            .scaleEffect(CGFloat(cupsOfTee))

        
            
        }
        VStack{
            Stepper("Scale amount",value: $animation2.animation(.easeIn), in: 1...5)
            Spacer()
            
            Button("Tap me"){
                animation2 += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(Circle())
            .scaleEffect(CGFloat(animation2))
        }
        VStack{
            Button("Tap me"){
                //animationAmoun += 1
                
            }
            .padding(50)
            .background(animationAmoun > 3 ? Color.green : Color.red)
            .foregroundStyle(.white)
            .clipShape(Circle())
            
            .overlay(
                Circle()
                    .stroke(Color.blue)
                    .scaleEffect(animationAmoun)
                    .animation(
                        .easeOut(duration: 1)
                        .repeatForever(autoreverses: false),
                        value: animationAmoun
                    )
                
            )
            .onAppear {
                animationAmoun = 2
            }
        }
            
    }
}

#Preview {
    ContentView()
}
