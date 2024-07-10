//
//  Utils.swift
//  CreateData
//
//  Created by Makra Flórián Róbert on 24/06/2024.
//

import Foundation

enum Constants {
    static let weaponsFilename = "weapons.store"
    static let tempFileName = "temp.store"
}

struct DefaultsJSON {
    
    static func decode<T: Codable>(from fileName: String, type: T.Type) -> T? {
       
        do {
            guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
                  let data = try? Data(contentsOf: url) else {
                return nil
            }
            
            let result = try JSONDecoder().decode(T.self, from: data)
            
            return result
        } catch {
            print(error)
            return nil
        }

    }
}
