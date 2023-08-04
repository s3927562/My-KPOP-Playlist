/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Tran Thanh Tung
 ID: s3927562
 Created date: 26/07/2023
 Last modified: 03/08/2023
 Acknowledgement: RMIT University, COSC2659 Course, Week 1 - 5 Lecture Slides & Videos
 */

import SwiftUI

struct ArtistInfo: View {
    let artist: Artist
    
    var body: some View {
        VStack {
            // Artist name
            HStack {
                Text(artist.name)
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            
            // Company name and favorite status
            HStack {
                Text(artist.company.name)
                    .font(.headline)
                    .foregroundColor(.gray)
                Spacer()
                artist.favIcon.symbolRenderingMode(.monochrome).foregroundColor(.yellow)
            }
            
            Divider()
            
            // Artist description
            HStack {
                Text(artist.description)
                Spacer()
            }
            
            // Reference
            HStack {
                Spacer()
                Text("- Source")
            }
        }
        .padding([.leading, .trailing])
    }
}

struct ArtistInfo_Previews: PreviewProvider {
    static var previews: some View {
        ArtistInfo(artist: artists[0])
    }
}
