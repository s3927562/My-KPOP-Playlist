/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Tran Thanh Tung
 ID: s3927562
 Created date: 25/07/2023
 Last modified: 04/08/2023
 Acknowledgement:
 RMIT University, COSC2659 Course, Week 1 - 5 Lecture Slides & Videos
 How To Add A Search Bar To A List In SwiftUI | Luke Roberts
 https://lukeroberts.co/blog/swiftui-search-bar/
 List | Apple Developer Documentation
 https://developer.apple.com/documentation/swiftui/list
 Default a View in NavigationView with SwiftUI | DEV Community
 https://dev.to/maeganwilson_/default-a-view-in-navigationview-with-swiftui-183p
 sorting - How to sort an array of custom objects by property value in Swift - Stack Overflow:
 https://stackoverflow.com/questions/24130026/how-to-sort-an-array-of-custom-objects-by-property-value-in-swift
 */

import SwiftUI

struct ArtistListView: View {
    @AppStorage("darkMode") private var darkMode = false // Store dark mode settings
    @State private var searchText = ""
    @State private var favOnly = true // Set to true then set to false when view appear to fix display issue on iPad
    
    var body: some View {
        NavigationView {
            List {
                Toggle("Show only favorite artists", isOn: $favOnly) // 'Favortie artist' toggle
                
                // Filter the list if the 'Favorite artist' toggle is on then sort by alphabetical order
                let favArtists = artists.filter { $0.favStatus || !favOnly }.sorted { $0.name < $1.name }
                
                // Further filter the list if using the search function then create a NavigationLink for each entry
                ForEach(searchText.isEmpty ? favArtists : favArtists.filter { $0.name.lowercased().contains(searchText.lowercased()) }, id: \.self.name) {artist in
                    NavigationLink {
                        ArtistView(artist: artist)
                    } label: {
                        ArtistListItem(artist: artist)
                    }
                }}
            .searchable(text: $searchText) // List search bar
            .navigationTitle("Artists")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    // Button for switching color scheme between light and dark using state variable
                    Button(action: {
                        darkMode = !darkMode
                    }, label: {
                        darkMode ? Image(systemName: "sun.max.fill") : Image(systemName: "moon.fill")
                    })
                }
            }
        }
        .onAppear() {
            favOnly = !favOnly // Fix list display issue on iPad
        }
    }
}

struct ArtistListView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistListView()
    }
}
