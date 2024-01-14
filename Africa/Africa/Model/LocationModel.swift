//
//  LocationModel.swift
//  Africa
//
//  Created by Rodrigo Conte on 14/01/24.
//

import Foundation
import MapKit

struct LocationModel: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    // MARK: - Computed properties
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
