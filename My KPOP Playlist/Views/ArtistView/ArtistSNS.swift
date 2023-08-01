/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Tran Thanh Tung
 ID: s3927562
 Created date: 01/08/2023
 Last modified: 01/08/2023
 Acknowledgement:
 RMIT University, COSC2659 Course, Week 1 - 5 Lecture Slides & Videos
 Open a URL when tapping a SwiftUI Button - SwiftSpeedy:
 https://swiftspeedy.com/open-a-url-when-tapping-a-swiftui-button/
 swift - In SwiftUI, How do I increase the height of a button? - Stack Overflow:
 https://stackoverflow.com/questions/59290097/in-swiftui-how-do-i-increase-the-height-of-a-button
 ios - How to convert string to URL in swift - Stack Overflow:
 https://stackoverflow.com/questions/48075421/how-to-convert-string-to-url-in-swift
 */

import SwiftUI

struct ArtistSNS: View {
    var artistSNS: [SNS]
    
    var body: some View {
        ForEach(artistSNS) { sns in
            Button {
                if let uri = URL(string: sns.link.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") {
                    UIApplication.shared.open(uri)
                }
            } label: {
                    Spacer()
                    Text(sns.text)
                        .frame(height: 34)
                    Spacer()
            }
            .buttonStyle(.bordered)
            .padding([.leading, .trailing])
        }
    }
}

struct ArtistSNS_Previews: PreviewProvider {
    static var previews: some View {
        ArtistSNS(artistSNS: artists[0].sns)
    }
}
