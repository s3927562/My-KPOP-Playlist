//
//  CircleImage.swift
//  My KPOP Playlist
//
//  Created by Tung Tran Thanh on 25/07/2023.
//

import SwiftUI

struct ArtistIcon: View {
    let artistIcon: Image
    
    var body: some View {
        artistIcon
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color(.white), lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct ArtistIcon_Previews: PreviewProvider {
    static var previews: some View {
        ArtistIcon(artistIcon: artists[0].icon)
    }
}
