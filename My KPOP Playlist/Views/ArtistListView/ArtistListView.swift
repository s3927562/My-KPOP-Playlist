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
 */

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
