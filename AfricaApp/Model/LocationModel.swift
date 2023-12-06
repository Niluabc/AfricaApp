//
//  LocationModel.swift
//  Africa
//
//  Created by Nilam Shah on 01/12/23.
//

import Foundation
import MapKit

struct NationalParkLocation: Identifiable, Codable {
    var id : String
    var name : String
    var image : String
    var latitude : Double
    var longitude : Double
    
    //Computed Properties
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
