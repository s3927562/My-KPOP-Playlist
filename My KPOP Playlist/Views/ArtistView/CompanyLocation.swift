/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Tran Thanh Tung
 ID: s3927562
 Created date: 28/07/2023
 Last modified: 31/07/2023
 Acknowledgement:
 RMIT University, COSC2659 Course, Week 1 - 5 Lecture Slides & Videos
 MapKit: How to add a pin to a map (MapAnnotations) - CodeWithChris : CodeWithChris
 https://codewithchris.com/swiftui/swiftui-map-annotation/
 */

import SwiftUI
import MapKit

struct CompanyLocation: View {
    let company: Company
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [company], annotationContent: { company in MapMarker(coordinate: company.location) })
            .onAppear() {
                region = MKCoordinateRegion(center: company.location, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            }
            .frame(height: 250)
        
    }
}

struct ArtistLocation_Previews: PreviewProvider {
    static var previews: some View {
        CompanyLocation(company: artists[0].company)
    }
}
