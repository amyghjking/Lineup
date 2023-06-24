//
//  Lineup.swift
//  Lineup
//
//  Created by Amy King on 23/06/23.
//  A representation of a lineup
//

import Foundation
import SwiftUI

struct Lineup: Hashable, Codable, Identifiable {
    var id: Int
    var name: String

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    init(id: Int, name: String, imageName: String) {
        self.id = id
        self.name = name
        self.imageName = imageName
    }
}
