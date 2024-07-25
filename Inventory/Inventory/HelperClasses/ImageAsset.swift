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
    case image8 = "stick1"
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
    case image25 = "toilettenpapier"
    
    
    
    
    var displayName: String {
        switch self {
        case .image1:
            return "Sport BH"
        case .image2:
            return "Gymnastikmatte"
        case .image3:
            return "Tablet"
        case .image4:
            return "Shaker"
        case .image5:
            return "Hose"
        case .image6:
            return "Hemd"
        case .image7:
            return "Sofa"
        case .image8:
            return "USB Stick"
        case .image9:
            return "CD"
        case .image10:
            return "Festplatte"
        case .image11:
            return "Smartphone"
        case .image12:
            return "Smartphone"
        case .image13:
            return "Smartphone"
        case .image14:
            return "Smartwatch"
        case .image15:
            return "Staubsauger"
        case .image16:
            return "Fernseher"
        case .image17:
            return "Waschmaschine"
        case .image18:
            return "Microwelle"
        case .image19:
            return "Microfone"
        case .image20:
            return "Kühlschrank"
        case .image21:
            return "Handy"
        case .image22:
            return "Gitarre"
        case .image23:
            return "Trommel"
        case .image24:
            return "Bett"
        case .image25:
            return "Toilettenpapier"
        }
    }
        
        var image: Image {
            Image(rawValue)
        }
    }

