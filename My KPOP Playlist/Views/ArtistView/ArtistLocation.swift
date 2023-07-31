//
//  ArtistLocation.swift
//  My KPOP Playlist
//
//  Created by Tung Tran Thanh on 28/07/2023.
//

import SwiftUI
import MapKit

struct ArtistLocation: View {
    let company: Company
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear() {
                region = MKCoordinateRegion(center: company.location, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            }
        .frame(height: 250)

    }
}

struct ArtistLocation_Previews: PreviewProvider {
    static var previews: some View {
        ArtistLocation(company: artists[0].company)
    }
}
