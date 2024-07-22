//
//  ImageStore.swift
//  Inventory
//
//  Created by Lutz Brückner on 22.07.24.
//

import SwiftUI

class ImageStore {
    static let shared = ImageStore()
    
    func image(named name: String) -> Image? {
        return Image(name)
    }
}
