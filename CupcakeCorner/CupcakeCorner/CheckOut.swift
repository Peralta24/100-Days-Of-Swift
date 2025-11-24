//
//  CheckOut.swift
//  CupcakeCorner
//
//  Created by Jose Rafael Peralta Martinez  on 23/11/25.
//

import SwiftUI

struct CheckOut: View {
    var order : Order
    @State private var confirmMessage = ""
    @State private var showingConfirmationAlert = false
    
    @State private var failMessage = ""
    @State private var showingFailAlert = false
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"),scale: 3){
                    image in
                    image
                        .resizable()
                        .scaledToFit()
                }placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total cost is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order"){
                    Task {
                        await placeOrder()
                    }
                }
                .padding()

            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Your order is",isPresented: $showingConfirmationAlert) {
            Button("Ok"){}
        }message : {
            Text(confirmMessage)
        }
        .alert("Your order is",isPresented:$showingFailAlert){
            Button("Ok"){}
        }message : {
            Text(failMessage)
        }
    }
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to enconde order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue( "application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
        
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            //Manejar el resultado
            
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmMessage = "Your order for \(decodedOrder.quantity) x \(Order.types[decodedOrder.type].lowercased()) cupcakes has been placed. Thank you!)"
            showingConfirmationAlert = true
        } catch {
            failMessage = "We encountered an error placing your order. Please try again later."
            showingFailAlert = true
            print("Check out failed : \(error.localizedDescription)")
        }
        
    }
}

#Preview {
    CheckOut(order: Order())
}
