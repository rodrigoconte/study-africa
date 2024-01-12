//
//  VideoModel.swift
//  Africa
//
//  Created by Rodrigo Conte on 11/01/24.
//

import Foundation

struct VideoModel: Codable, Identifiable {
    
    let id: String
    let name: String
    let headline: String
    
    // MARK: - Computer properties
    
    var thumbnail: String {
        "video-\(id)"
    }
}
