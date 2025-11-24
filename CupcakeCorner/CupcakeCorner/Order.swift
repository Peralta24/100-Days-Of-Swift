//
//  Order.swift
//  CupcakeCorner
//
//  Created by Jose Rafael Peralta Martinez  on 22/11/25.
//

import Foundation

@Observable
class Order: Codable {
    struct savedAddress: Codable {
        var name: String
        var streetAddress: String
        var city: String
        var zip: String
    }
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnable = "specialRequestEnable"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _streetAddress = "streetAddress"
        case _city = "city"
        case _zip = "zip"
    }
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
    
    var name = "" {didSet{save()}}
    var streetAddress = "" {didSet{save()}}
    var city = "" {didSet{save()}}
    var zip = "" {didSet{save()}}
    
    var hasValidAddress: Bool {
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }
        return true
    }
    
    var cost: Decimal {
        // $2  per cake
        var cost = Decimal(quantity) * 2
        
        //complicated cakes cost more
        cost += Decimal(type) / 2
        
        //$1/ cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        // $0.50/ cake for sprinkles
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
    
    init() {
        let defaults = UserDefaults.standard
        
        if let data = defaults.data(forKey: "SavedAddress") {
            if let decoded = try? JSONDecoder().decode(savedAddress.self, from: data) {
                self.name = decoded.name
                self.streetAddress = decoded.streetAddress
                self.city = decoded.city
                self.zip = decoded.zip
            }
        }
    }
    
    
    func save() {
        let address = savedAddress(name: name, streetAddress: streetAddress, city: city, zip: zip)
        if let encoded = try? JSONEncoder().encode(address) {
            UserDefaults.standard.set(encoded, forKey: "SavedAddress")
        }
    }
}
