//
//  Artist.swift
//  My KPOP Playlist
//
//  Created by Tung Tran Thanh on 25/07/2023.
//

import Foundation
import SwiftUI

struct Artist {
    var name: String
    var company: Company
    var description: String
    
    var iconName: String
    var icon: Image {
        Image(iconName)
    }
    
    var coverName: String
    var cover: Image {
        Image(coverName)
    }
    
    var favStatus: Bool
    var favIcon: Image {
        favStatus ? Image(systemName: "star.fill") : Image(systemName: "star")
    }
}
