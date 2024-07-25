//
//  UnsplashPhoto.swift
//  Inventory
//
//  Created by Lutz Brückner on 26.07.24.
//

import Foundation

struct UnsplashPhoto: Codable, Identifiable {
    let id: String
    let urls: [String: String]
    let alt_description: String?
    
    var imageUrl: String {
        urls["regular"] ?? ""
    }
}
