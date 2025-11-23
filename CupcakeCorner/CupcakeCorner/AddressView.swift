//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Jose Rafael Peralta Martinez  on 22/11/25.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order : Order
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name )
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip Code", text: $order.zip)
            }
            Section {
                NavigationLink("Check out") {
                    CheckOut(order: order)
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order: Order())
}
