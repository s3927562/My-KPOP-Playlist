/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Tran Thanh Tung
 ID: s3927562
 Created date: 01/08/2023
 Last modified: 01/08/2023
 Acknowledgement: RMIT University, COSC2659 Course, Week 1 - 5 Lecture Slides & Videos
 ColorScheme | Apple Developer Documentation:
 https://developer.apple.com/documentation/swiftui/colorscheme
 preferredColorScheme(_:) | Apple Developer Documentation:
 https://developer.apple.com/documentation/swiftui/view/preferredcolorscheme(_:)
 */
import SwiftUI

struct LaunchView: View {
    @Environment(\.colorScheme) private var colorScheme // Get system color scheme
    @AppStorage("firstLaunch") private var firstLaunch = true // Set first launch status
    @AppStorage("darkMode") private var darkMode = false // Store dark mode settings
    @State private var launchView = true
    
    var body: some View {
        ZStack{
            if launchView {
                VStack {
                    Text("Insert RMIT Icon")
                        .font(.largeTitle)
                    Text("Insert App Icon")
                        .font(.title)
                    Text("App Name")
                        .font(.title2)
                    Text("Insert Slogan")
                        .font(.title3)
                    Text("not as good")
                    Button {
                        launchView = false
                    } label: {
                        HStack {
                            Text("Go!")
                            Image(systemName: "arrow.right")
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                }

            } else {
                ArtistListView()
            }
        }
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
        .preferredColorScheme(darkMode ? .dark : .light) // Set color scheme based on state variable
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
