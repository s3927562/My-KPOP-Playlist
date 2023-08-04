/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Tran Thanh Tung
 ID: s3927562
 Created date: 28/07/2023
 Last modified: 31/07/2023
 Acknowledgement: RMIT University, COSC2659 Course, Week 1 - 5 Lecture Slides & Videos
 */

import Foundation
import MapKit

struct Company: Identifiable, Codable {
    var id: UUID {
        UUID() // Used for MapMarker
    }
    var name: String
    
    var latitude: Double
    var longitude: Double
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
