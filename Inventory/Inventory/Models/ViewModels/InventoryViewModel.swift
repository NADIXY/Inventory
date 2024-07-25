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
    @Published var categories: [CategoryEntity] = []
    
    private let repository = InventoryRepository()
    
    init() {
        
        fetchInventoryItems()
        fetchCategories()
    }
    
    func fetchInventoryItems(category: String? = nil, subcategory:String? = nil) {
        inventoryItems = repository.fetchInventoryItems(category: category, subcategory: subcategory)
    }
    
    func itemCount(for category: String, subcategory: String) -> Int {
        let filteredItems = inventoryItems.filter  { $0.category == category && $0.subcategory == subcategory }
        return filteredItems.reduce(0) { $0 + Int($1.quantity) }
        }
    
    func addInventoryItem(name: String, quantity: Int64, imageName: String, info: String, category: String, subcategory: String) {
        repository.addInventoryItem(name: name, quantity: quantity, imageName: imageName, info: info, category: category, subcategory: subcategory)
            fetchInventoryItems(category: category, subcategory: subcategory)
    }
    
    func deleteInventoryItem(items: [InventoryItem], category: String, subcategory: String) {
        for item in items {
            repository.deleteInventoryItem(item: item)
        }
        fetchInventoryItems(category: category, subcategory: subcategory)
    }
    
    
    func updateInventoryItem(item: InventoryItem, name: String, quantity: Int64, imageName: String, info: String) {
        repository.updateInventoryItem(item: item, name: name, quantity: quantity, info: info, imageName: imageName)
        fetchInventoryItems()
    }
    
    func fetchCategories() {
        categories = repository.fetchCategories()
        
    }
    
    func addCategory(name: String, imageName: String, subcategories: [String]) {
        repository.addCategory(name: name, imageName: imageName, subcategories: subcategories)
        fetchCategories()
    }
    
    func deleteCategory(category: CategoryEntity) {
        repository.deleteCategory(category: category)
        fetchCategories()
    }

    func deleteSubcategory(categoryName: String, subcategoryName: String) {
        repository.deleteSubcategory(categoryName: categoryName, subcategoryName: subcategoryName)
        fetchCategories()
        fetchInventoryItems(category: categoryName)
        
    }
}




