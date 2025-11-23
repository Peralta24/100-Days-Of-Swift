//
//  Order.swift
//  CupcakeCorner
//
//  Created by Jose Rafael Peralta Martinez  on 22/11/25.
//

import Foundation

@Observable
class Order {
    static let types = ["Vanilla", "Chocolate", "Strawberry", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnable = false {
        didSet{
            if specialRequestEnable == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
}
