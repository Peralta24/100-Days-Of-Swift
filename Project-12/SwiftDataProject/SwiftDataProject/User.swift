//
//  User.swift
//  SwiftDataProject
//
//  Created by Jose Rafael Peralta Martinez  on 30/11/25.
//

import Foundation
import SwiftData

@Model
class User {
    var name : String
    var city : String
    var joinDate : Date
    @Relationship(deleteRule: .cascade) var jobs = [Job]()
    
    init(name : String, city : String, joinDate : Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
        
    }
}

//
//Button("Add Samples", systemImage: "plus") {
//    try? modelContext.delete(model:User.self)
//    let first = User(name: "Ed Sheeran", city: "london", joinDate: .now.addingTimeInterval(86400 * -10))
//    let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
//    let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
//    let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))
//
//    modelContext.insert(first)
//    modelContext.insert(second)
//    modelContext.insert(third)
//    modelContext.insert(fourth)
//}
