//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Jose Rafael Peralta Martinez  on 03/11/25.
//

import Foundation

extension Bundle {
    
    func decode(_ file : String) -> [String : Astronaut]{
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError( "Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) as Data.")
        }
        
        let decoder = JSONDecoder()
        
        
        do {
            return try decoder.decode([String: Astronaut].self, from: data)
        }catch DecodingError.keyNotFound(let key, let context){
            fatalError("Failed to decode \(file) from bundle due to missing  key \(key.stringValue)")
        }catch DecodingError.typeMismatch(let type, let context){
            fatalError("Failed to decode \(file) from bundle due to type mismatch \(context.debugDescription)")
        }catch DecodingError.valueNotFound(let type, let context){
            fatalError("Failed to decode \(file) from bundle due to value not found \(context.debugDescription)")
        }catch DecodingError.dataCorrupted(let context){
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        }catch {
            fatalError("Failed to decode \(file) from bundle")
        }
    }
}
