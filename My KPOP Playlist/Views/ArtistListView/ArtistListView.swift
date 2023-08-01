/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Tran Thanh Tung
 ID: s3927562
 Created date: 25/07/2023
 Last modified: 01/08/2023
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
 Default a View in NavigationView with SwiftUI | DEV Community
 https://dev.to/maeganwilson_/default-a-view-in-navigationview-with-swiftui-183p
 */

import SwiftUI

struct ArtistListView: View {
    @Environment(\.colorScheme) private var colorScheme // Get system color scheme
    @AppStorage("firstLaunch") private var firstLaunch = true // Set first launch status
    @AppStorage("darkMode") private var darkMode = false // Store dark mode settings
    @State private var searchText = ""
    @State private var favOnly = false
    @State private var currentNavView: String?
    
    var body: some View {
        NavigationView {
            List { // List(selection: $currentNavView)
                let favArtists = artists.filter { $0.favStatus || !favOnly }
                Toggle("Show only favorite artists", isOn: $favOnly)
                ForEach(searchText.isEmpty ? favArtists : favArtists.filter { $0.name.lowercased().contains(searchText.lowercased()) }, id: \.self.name) {artist in
                    NavigationLink { // NavigationLink(tag: artist.name, selection: $currentNavView)
                        ArtistView(artist: artist)
                    } label: {
                        ArtistListItem(artist: artist)
                    }
                }}
//            .onAppear{ // Auto select view on landscape iPad
//                let device = UIDevice.current
//                if device.model == "iPad" && device.orientation.isLandscape{
//                    self.currentNavView = artists[0].name
//                } else {
//                    self.currentNavView = nil
//                }
//            }
            .searchable(text: $searchText) // List search bar
            .navigationTitle("Artists")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) { // deprecated, replace with topBarTrailing
                    
                    // Button for switching color scheme between light and dark using state variable
                    Button(action: {
                        darkMode = !darkMode
                    }, label: {
                        darkMode ? Image(systemName: "moon.fill") : Image(systemName: "sun.max.fill")
                    })
                }
            }
        }
        .preferredColorScheme(darkMode ? .dark : .light) // Set color scheme based on state variable
        .onAppear() {
            // Set color scheme state variable on first launch based on system settings
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
