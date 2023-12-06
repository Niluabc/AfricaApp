//
//  MapView.swift
//  Africa
//
//  Created by Nilam Shah on 22/11/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: PROPERTIES
    @State private var region: MapCameraPosition = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 100.0, longitudeDelta: 1000.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return MapCameraPosition.region(mapRegion)
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode(file: "locations.json")
    
    var body: some View {
        // 1. BASIC MAP
//        Map(position: $region)
        
        // 2. ADVANCED MAP
        /*Map(position: $region) {
            ForEach(locations) { item in
                /*Marker(coordinate: item.location) {
                    Text(item.name)
                }
                .tint(.accent)*/
                
                // Annotations can be interactive
                Annotation(item.name, coordinate: item.location, anchor: .bottom) {
                    Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height:32)

                }
            }
        }*/
        
        // 3. Custom advanced annotation (Interactive)
        Map(position: $region) {
            ForEach(locations) { location in
                Annotation(location.name, coordinate: location.location) {
                    MapAnnotationView(location: location)
                }
            }
        }
        .overlay (
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude :")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.region!.center.latitude)")
                            .font(.footnote)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude :")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.region!.center.longitude)")
                            .font(.footnote)
                    }
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .clipShape(
                        RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                    )
                    .opacity(0.6)
            )
            .padding()
            ,
            alignment: .top
        )
    }
}

#Preview {
    MapView()
}
