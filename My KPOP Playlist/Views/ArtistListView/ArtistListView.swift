/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Tran Thanh Tung
 ID: s3927562
 Created date: 25/07/2023
 Last modified: 31/07/2023
 Acknowledgement:
 RMIT University, COSC2659 Course, Week 1 - 5 Lecture Slides & Videos
 ColorScheme | Apple Developer Documentation:
 https://developer.apple.com/documentation/swiftui/colorscheme
 preferredColorScheme(_:) | Apple Developer Documentation:
 https://developer.apple.com/documentation/swiftui/view/preferredcolorscheme(_:)
 How To Add A Search Bar To A List In SwiftUI | Luke Roberts
 https://lukeroberts.co/blog/swiftui-search-bar/
 List | Apple Developer Documentation
 https://developer.apple.com/documentation/swiftui/list
 */

import SwiftUI

struct ArtistListView: View {
    @Environment(\.colorScheme) private var colorScheme
    @AppStorage("firstLaunch") private var firstLaunch = true
    @AppStorage("darkMode") private var darkMode = false
    @State private var searchText = ""
    @State private var favOnly = false
    
    var body: some View {
        NavigationView {
            List() {
                var favArtists = artists.filter { $0.favStatus || !favOnly }
                Toggle("Show only favorite artists", isOn: $favOnly)
                ForEach(searchText.isEmpty ? favArtists : favArtists.filter { $0.name.lowercased().contains(searchText.lowercased()) }, id: \.self.name) {artist in
                    NavigationLink {
                        ArtistView(artist: artist)
                    } label: {
                        ArtistListItem(artist: artist)
                    }
                }}
            .navigationTitle("Artists")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) { // deprecated, should be replaced with topBarTrailing
                    Button(action: {
                        darkMode = !darkMode
                    }, label: {
                        darkMode ? Image(systemName: "moon.fill") : Image(systemName: "sun.max.fill")
                    })
                }
            }
        }
        .searchable(text: $searchText)
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
