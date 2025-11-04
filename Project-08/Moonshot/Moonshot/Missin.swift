//
//  Missin.swift
//  Moonshot
//
//  Created by Jose Rafael Peralta Martinez  on 03/11/25.
//

import Foundation

struct Mission: Codable, Identifiable {
    
    struct CrewRole : Codable {
        let name: String
        let role: String
    }
    
    let id : Int
    let launchDate : String?
    let crew: [CrewRole]
    let description: String
}
