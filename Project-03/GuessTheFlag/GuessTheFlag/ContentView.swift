//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jose Rafael Peralta Martinez  on 09/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var mensaje = "Selecciona una accion"
    @State private var alerta = false
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.orange, .pink]), startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            
            VStack(spacing:30){
                Text("Panel de Control")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                
                Text(mensaje)
                    .font(.title2)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)

                HStack(spacing:50){
                    Image(systemName: "play")
                    Image(systemName: "pause")
                    Image(systemName: "stop")
                }
                .font(.largeTitle)
                .foregroundStyle(.white)
                
                
                HStack(spacing: 20){
                   
                    Button("Accion1"){
                        mensaje = "Accion 1 activada!"
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                    
                    
                    Button("Accion2",role: .destructive){
                        mensaje = "Accion 2 activada!"
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("Alerta"){
                        alerta = true
                    }
                    .padding()
                    .foregroundStyle(.white)
                    .buttonStyle(.borderedProminent)
                    .alert("Importante",isPresented: $alerta){
                        Button("Save"){}
                        Button("Undo"){}
                    }message: {
                        Text("Mensaje Importante")
                    }

                }
                Label("Configuracion", systemImage: "gear")
                    .padding()
                    .background(.cyan)
                    .cornerRadius(12)
            }

            
        }
        

    }

}

#Preview {
    ContentView()
}
