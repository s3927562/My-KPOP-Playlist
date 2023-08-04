/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Tran Thanh Tung
 ID: s3927562
 Created date: 01/08/2023
 Last modified: 04/08/2023
 Acknowledgement: RMIT University, COSC2659 Course, Week 1 - 5 Lecture Slides & Videos
 ColorScheme | Apple Developer Documentation:
 https://developer.apple.com/documentation/swiftui/colorscheme
 preferredColorScheme(_:) | Apple Developer Documentation:
 https://developer.apple.com/documentation/swiftui/view/preferredcolorscheme(_:)
 combine - SwiftUI: Random "Extra argument in call" error - Stack Overflow:
 https://stackoverflow.com/questions/61178868/swiftui-random-extra-argument-in-call-error
 alert(_:isPresented:presenting:actions:message:) | Apple Developer Documentation:
 https://developer.apple.com/documentation/swiftui/view/alert(_:ispresented:presenting:actions:message:)-8584l
 animation(_:value:) | Apple Developer Documentation:
 https://developer.apple.com/documentation/swiftui/view/animation(_:value:)
 accentColor | Apple Developer Documentation:
 https://developer.apple.com/documentation/swiftui/color/accentcolor
 */
import SwiftUI

struct LaunchView: View {
    @Environment(\.colorScheme) private var colorScheme // Get system color scheme
    @AppStorage("firstLaunch") private var firstLaunch = true // Set first launch status
    @AppStorage("darkMode") private var darkMode = false // Store dark mode settings
    @State private var launchView = true // State variable for switching view
    @State private var infoAlert = false // State variable for information pop-up
    
    var body: some View {
        ZStack{
            if launchView {
                VStack {
                    // Images
                    Group {
                        Image(darkMode ? "rmit-logo-white" : "rmit-logo-black")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Spacer()
                        
                        Image("app-icon")
                        Spacer()
                    }
                    
                    // Texts
                    Group {
                        Text("My KPOP Playlist")
                            .font(.largeTitle)
                        Spacer()
                        
                        Text("Go with the flow, listen on the go!")
                            .font(.title3)
                        Spacer()
                    }
                    .bold()
                    .multilineTextAlignment(.center)
                    
                    // Buttons
                    Group {
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
                        Spacer()
                        
                        HStack {
                            Spacer()
                            Button {
                                infoAlert = true
                            } label: {
                                Image(systemName: "info.circle.fill")
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(Color.white, Color.accentColor)
                            }
                        }
                    }
                }
                .padding()
                .alert("Information", isPresented: $infoAlert) {} message: {
                    VStack {
                        Text("Name: Tran Thanh Tung\nStudent ID: s3927562\nProgram: BH120 - Bachelor of Engineering (Software Engineering) (Honours)")
                    }
                }
            } else {
                ArtistListView()
            }
        }
        .animation(.default, value: launchView)
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
