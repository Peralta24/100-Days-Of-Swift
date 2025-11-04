//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Jose Rafael Peralta Martinez  on 03/11/25.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file : String) -> T{
       
        guard let url = url(forResource: file, withExtension: "json") else {
            fatalError( "File not found")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError( "File not found")
        }
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: data)
        }catch DecodingError.keyNotFound(let key, let context) {
            fatalError()
        }catch {
            fatalError()
        }
    }
}
