//
//  InventoryRepositoryError.swift
//  Inventory
//
//  Created by Lutz Brückner on 25.07.24.
//

import Foundation

enum InventoryRepositoryError: Error {
    case preloadCategory
    case fetchInventoryItems
    case addInventoryItem
    case deleteInventoryItem
    case updateInventoryItem
    case loadImageData
    case fetchCategories
    case fetchSubcategories
    case addCategory
    case deleteCategory
    case deleteSubcategory
    case saveContext
}
