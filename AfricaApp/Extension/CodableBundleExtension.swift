//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Nilam Shah on 22/11/23.
//

import Foundation

extension Bundle {
    func decode <T: Codable> (file: String) -> T {
        // 1. Locate the JSON File
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        // 2. Create property for data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        // 3. Create decoder
        let decoder = JSONDecoder()
        
        // 4. Create property for the decoder data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        // 5. Return the ready to use data
        return loaded
    }
}
