//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Rodrigo Conte on 28/12/23.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [Cover] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode([Cover].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return loaded
    }
}
