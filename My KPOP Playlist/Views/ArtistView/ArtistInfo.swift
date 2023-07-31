//
//  ArtistInfo.swift
//  My KPOP Playlist
//
//  Created by Tung Tran Thanh on 26/07/2023.
//

import SwiftUI

struct ArtistInfo: View {
    let artist: Artist
    
    var body: some View {
        VStack {
            HStack {
                Text(artist.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading, 17)
                Spacer()
            }
            HStack {
                Text(artist.company.name)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.leading, 17)
                Spacer()
                artist.favIcon.symbolRenderingMode(.monochrome).foregroundColor(.yellow)
                    .padding(.trailing, 17)
            }
            Divider()
                .padding([.leading, .trailing], 17)
            HStack {
                Text(artist.description)
                    .padding([.trailing, .leading], 17)
                Spacer()
            }
        }
    }
}

struct ArtistInfo_Previews: PreviewProvider {
    static var previews: some View {
        ArtistInfo(artist: artists[0])
    }
}
