//
//  Student.swift
//  BookWorm
//
//  Created by Jose Rafael Peralta Martinez  on 25/11/25.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name : String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
