//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Jose Rafael Peralta Martinez  on 30/11/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var isShowingUpComing = false
    @State private var sortOder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    @State private var path = [User]()
    var body: some View {
        NavigationStack {
            UsersView(minimumjoinDate: isShowingUpComing ? .now : .distantPast, sortOder: sortOder)
            .navigationTitle("Users")
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model:User.self)
                    let first = User(name: "Ed Sheeran", city: "london", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))

                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
                Button(isShowingUpComing ? "Show Everyone" : "Show Upcoming") {
                    isShowingUpComing.toggle()
                }
                
                Menu("Sort",systemImage: "arrow.up.arrow.down") {
                    Picker("Sort by", selection: $sortOder) {
                        Text("Sort by name")
                            .tag([
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate)
                            ])
                        
                        Text("Sort by joinDate")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name)
                            ])
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
