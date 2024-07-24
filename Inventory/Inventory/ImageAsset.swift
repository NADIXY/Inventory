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
    case image5 = "hose"
    case image6 = "hemden"
    case image7 = "sofa"
    case image8 = "stick 1"
    case image9 = "cd"
    case image10 = "festplatte"
    
    var image: Image {
        Image(rawValue)
    }
    
    var name: String {
        rawValue
    }
}
