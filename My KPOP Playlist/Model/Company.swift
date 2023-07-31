//
//  Company.swift
//  My KPOP Playlist
//
//  Created by Tung Tran Thanh on 28/07/2023.
//

import Foundation
import MapKit

struct Company: Identifiable {
    var id = UUID()
    var name: String
    
    var latitude: Double
    var longitude: Double
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
