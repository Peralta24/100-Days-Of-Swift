//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Jose Rafael Peralta Martinez  on 03/11/25.
//

import Foundation

extension Bundle {
    
    func decode <T: Codable> (_ file : String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError( "Couldn't find \(file).json")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError( "Couldn't load \(file).json")
        }
        
        let decoder = JSONDecoder()
        let formatted = DateFormatter()
        formatted.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatted)
        
        do {
            return try decoder.decode(T.self, from: data)
        }catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Error in \(file).json at \(key), \(context)")
        }catch{
            fatalError(error.localizedDescription)
        }
    }
}
