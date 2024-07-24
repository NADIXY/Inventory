//
//  ImageAsset.swift
//  Inventory
//
//  Created by Lutz Brückner on 24.07.24.
//

import SwiftUI

enum ImageAsset: String, CaseIterable {
    case image1 = "sportbh"
    case image2 = "gymnastikmatte"
    case image3 = "tablet"
    case image4 = "trinkflasche"
    
    var image: Image {
        Image(rawValue)
    }
    
    var name: String {
        rawValue
    }
}
