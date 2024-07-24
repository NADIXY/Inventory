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
    case image11 = "smartphone"
    case image12 = "smartphone2"
    case image13 = "smartphone3"
    case image14 = "smartwatch1"
    case image15 = "staubsauger"
    case image16 = "tv"
    case image17 = "waschmaschine"
    case image18 = "mikrowelle"
    case image19 = "micro"
    case image20 = "kühlschränke"
    case image21 = "handy1"
    case image22 = "gitarre"
    case image23 = "drum"
    case image24 = "betten"
   
    
    

    
    
    
    var image: Image {
        Image(rawValue)
    }
    
    var name: String {
        rawValue
    }
}
