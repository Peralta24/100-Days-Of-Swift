//
//  ContentView.swift
//  iExpense
//
//  Created by Jose Rafael Peralta Martinez  on 27/10/25.
//

import SwiftUI
@Observable
class User {
    var firstName = "Jose"
    var lastName = "Peralta"
}

struct ContentView: View {
    @State private var user = User()

    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            TextField("First Name",text: $user.firstName)
            TextField("Last Name",text: $user.lastName)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
