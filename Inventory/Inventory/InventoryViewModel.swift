//
//  InventoryViewModel.swift
//  Inventory
//
//  Created by Lutz Brückner on 22.07.24.
//

import SwiftUI
import Foundation
import CoreData

class InventoryViewModel: ObservableObject {
    @Published var inventoryItems: [InventoryItem] = []
    @Published var categories: [Category] = []
    
    private let repository = InventoryRepository()
    
    init() {
        fetchInventoryItems()
        fetchCategories()
    }
    
    func fetchInventoryItems(category: String? = nil, subcategory:String? = nil) {
        inventoryItems = repository.fetchInventoryItems(category: category, subcategory: subcategory)
    }
    
    func itemCount(for category: String, subcategory: String) -> Int {
            return inventoryItems.filter { $0.category == category && $0.subcategory == subcategory }.count
        }
    
    func addInventoryItem(name: String, quantity: Int64, imageName: String, category: String, subcategory: String) {
        repository.addInventoryItem(name: name, quantity: quantity, imageName: imageName, category: category, subcategory: subcategory)
            fetchInventoryItems(category: category, subcategory: subcategory)
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
    
    func fetchCategories() {
        categories = repository.fetchCategories()
        fetchInventoryItems()
    }
    
    func addCategory(name: String, imageName: String, subcategories: [String]) {
        repository.addCategory(name: name, imageName: imageName, subcategories: subcategories)
        fetchCategories()
    }
    
}




