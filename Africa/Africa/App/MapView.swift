//
//  MapView.swift
//  Africa
//
//  Created by Rodrigo Conte on 27/12/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - Properties
    @State private var cameraRegion: MapCameraPosition = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return MapCameraPosition.region(mapRegion)
    }()
    
    let locations: [LocationModel] = Bundle.main.decode([LocationModel].self, from: "locations.json")
    
    // MARK: - Body
    var body: some View {
        Map(position: $cameraRegion) {
            ForEach(locations) { location in
                Annotation(location.id.capitalized, coordinate: location.location) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32, alignment: .center)
                }
            }
        }
            .mapStyle(.hybrid)
            
    }
}

#Preview {
    MapView()
}
