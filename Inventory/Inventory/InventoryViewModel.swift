//
//  InventoryViewModel.swift
//  Inventory
//
//  Created by Lutz Brückner on 22.07.24.
//

import SwiftUI
import Foundation

class InventoryViewModel: ObservableObject {
    @Published var inventoryItems: [InventoryItem] = []
    
    private let repository = InventoryRepository()
    
    init() {
        fetchInventoryItems()
    }
    
    func fetchInventoryItems() {
        inventoryItems = repository.fetchInventoryItems()
    }
    
    func addInventoryItem(name: String, quantity: Int64, imageName: String) {
        repository.addInventoryItem(name: name, quantity: quantity, imageName: imageName)
        fetchInventoryItems()
    }
    
    func deleteInventoryItem(at offsets: IndexSet) {
        for index in offsets {
            let item = inventoryItems[index]
            repository.deleteInventoryItem(item: item)
        }
        fetchInventoryItems()
    }
    
    func updateInventoryItem(item: InventoryItem, name: String, quantity: Int64, imageName: String) {
        repository.updateInventoryItem(item: item, name: name, quantity: quantity, imageName: imageName)
        fetchInventoryItems()
    }
}




