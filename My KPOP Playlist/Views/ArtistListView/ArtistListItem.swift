/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Tran Thanh Tung
 ID: s3927562
 Created date: 25/07/2023
 Last modified: 01/08/2023
 Acknowledgement: RMIT University, COSC2659 Course, Week 1 - 5 Lecture Slides & Videos
 */

import SwiftUI

struct ArtistListItem: View {
    let artist: Artist
    
    var body: some View {
        HStack {
            artist.icon
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 5))
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
