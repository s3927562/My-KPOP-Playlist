//
//  ArtistNavigate.swift
//  My KPOP Playlist
//
//  Created by Tung Tran Thanh on 25/07/2023.
//

import SwiftUI

struct ArtistListItem: View {
    let artist: Artist
    
    var body: some View {
        HStack {
            artist.icon
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .frame(width: 50, height: 50)
            VStack {
                HStack {
                    Text(artist.name)
                    Spacer()
                }
                HStack {
                    Text(artist.company.name)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            Spacer()
            artist.favIcon.symbolRenderingMode(.monochrome).foregroundColor(.yellow)
        }
    }
}

struct ArtistListItem_Previews: PreviewProvider {
    static var previews: some View {
        ArtistListItem(artist: artists[0])
    }
}
