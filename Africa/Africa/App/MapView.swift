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
    
    @State private var currentLogitude: CGFloat = 0.0
    @State private var currentLatitude: CGFloat = 0.0
    
    let locations: [LocationModel] = Bundle.main.decode([LocationModel].self, from: "locations.json")
    
    // MARK: - Body
    var body: some View {
        Map(position: $cameraRegion) {
            ForEach(locations) { location in
                Annotation("", coordinate: location.location) {
                    MapAnnotationView(location: location)
                }
            }
        }
        .onMapCameraChange { mapCameraUpdateContext in
            currentLogitude = mapCameraUpdateContext.region.center.longitude
            currentLatitude = mapCameraUpdateContext.region.center.latitude
        }
        .mapStyle(.hybrid)
        .overlay (
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(.accent)
                        Text("\(currentLatitude)")
                            .font(.footnote)
                            .foregroundStyle(.white)
                    }
                    Divider()
                    HStack {
                        Text("Logitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(.accent)
                        Text("\(currentLogitude)")
                            .font(.footnote)
                            .foregroundStyle(.white)
                        
                    }
                }
            }
                .padding(.vertical, 12)
                .padding(.horizontal, 12)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(),
            alignment: .top
        )
        
    }
}

#Preview {
    MapView()
}
