//
//  Users.swift
//  iFriends
//
//  Created by Jose Rafael Peralta Martinez  on 04/12/25.
//


import Foundation

struct Users: Codable, Identifiable, Hashable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friends]
    
    enum CodingKeys: String, CodingKey {
        case id
        case isActive
        case name
        case company
        case email
        case address
        case about
        case registered
        case tags
        case friends
        case age
    }
    
    init(id: String, isActive: Bool, name: String,age:Int, company: String, email: String, address: String, about: String, registered: String, tags: [String], friends: [Friends]) {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.about = about
        self.registered = registered
        self.tags = tags
        self.friends = friends
    }
    
    static let example = Users(id: "21212qsa", isActive: true, name: "Jose",age: 21, company: "Swift", email: "correo@orreo.com", address: "Calle de la calle", about: "I am a developer", registered: "1990-01-01", tags: ["Swift", "iOS"], friends: [Friends(id: "202jd21", name: "Pablo")])

}

struct Friends: Codable, Identifiable, Hashable {
    var id: String
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}

