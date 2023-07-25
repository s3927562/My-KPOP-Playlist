//
//  ArtistNavigate.swift
//  My KPOP Playlist
//
//  Created by Tung Tran Thanh on 25/07/2023.
//

import SwiftUI

struct ArtistListView: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("firstLaunch") var firstLaunch = true
    @AppStorage("darkMode") var darkMode = false
    
    var body: some View {
        NavigationView {
            List (artists, id: \.self.name) {artist in
                NavigationLink {
                    ArtistView(artist: artist)
                } label: {
                    ArtistListItem(artist: artist)
                }
            }
            .navigationTitle("Artists")
            .navigationBarItems(trailing: Button(action: {
                darkMode = !darkMode
            }, label: {
                darkMode ? Image(systemName: "sun.max.fill") : Image(systemName: "moon.fill")
            }))
        }
        .preferredColorScheme(darkMode ? .dark : .light)
        .onAppear() {
            if firstLaunch {
                if colorScheme == .light {
                    darkMode = false
                } else {
                    darkMode = true
                }
                firstLaunch = false
            }
        }
    }
}

struct ArtistListView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistListView()
    }
}
