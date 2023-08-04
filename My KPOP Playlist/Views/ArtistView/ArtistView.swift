/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Tran Thanh Tung
 ID: s3927562
 Created date: 25/07/2023
 Last modified: 04/08/2023
 Acknowledgement: RMIT University, COSC2659 Course, Week 1 - 5 Lecture Slides & Videos
 */

import SwiftUI
import MapKit

struct ArtistView: View {
    let artist: Artist
    
    var body: some View {
        ScrollView {
            VStack {
                CompanyLocation(company: artist.company)
                ArtistIcon(artistIcon: artist.icon)
                    .padding(.top, -110) // using offset leaves behind a margin
                ArtistInfo(artist: artist)
                Divider()
                    .padding([.trailing, .leading])
                ArtistSNS(artistSNS: artist.sns)
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
