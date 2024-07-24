//
//  InventoryApp.swift
//  Inventory
//
//  Created by Lutz Brückner on 22.07.24.
//

import SwiftUI

@main
struct InventoryApp: App {
    @StateObject private var viewModel = InventoryViewModel()
    
    init() {
        let repository = InventoryRepository()
        repository.preloadCategories(categories)
        
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(InventoryViewModel())
        }
    }
}
