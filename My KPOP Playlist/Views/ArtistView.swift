//
//  InfoView.swift
//  My KPOP Playlist
//
//  Created by Tung Tran Thanh on 25/07/2023.
//

import SwiftUI
import MapKit

struct ArtistView: View {
    let artist: Artist
    
    var body: some View {
        ScrollView {
            VStack {
                ArtistLocation(company: artist.company)
                ArtistIcon(artistIcon: artist.icon)
                    .padding(.top, -110)
                ArtistInfo(artist: artist)
            }
        }
        .navigationTitle(artist.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ArtistView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistView(artist: artists[0])
    }
}
