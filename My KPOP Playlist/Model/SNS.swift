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
 */

import Foundation
import SwiftUI

struct SNS: Identifiable, Codable {
    var id: UUID {
        UUID()
    }
    var text: String
    var link: String
}