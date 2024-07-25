//
//  InventoryRepository.swift
//  Inventory
//
//  Created by Lutz Brückner on 22.07.24.
//

import SwiftUI
import CoreData

class InventoryRepository {
    private let store = PersistenceStore.shared
    
    func preloadCategories(_ categories: [Category]) {
        let request = CategoryEntity.fetchRequest()
        
        do {
            let count = try store.context.count(for: request)
            if count == 0 {
                for category in categories {
                    let newCategory = CategoryEntity(context: store.context)
                    newCategory.id = UUID()
                    newCategory.name = category.name
                    newCategory.imageName = category.imageName
                    newCategory.subcategories = category.subcategories as NSObject
                }
                saveContext()
            }
        } catch {
            print("Error preloading categories: \(error)")
        }
    }
    
    func fetchInventoryItems(category: String? = nil, subcategory: String? = nil) -> [InventoryItem] {
        let request: NSFetchRequest<InventoryItem> = InventoryItem.fetchRequest()
        
        var predicates = [NSPredicate]()
        
        if let category = category {
            predicates.append(NSPredicate(format: "category == %@", category))
        }
        
        if let subcategory = subcategory {
            predicates.append(NSPredicate(format: "subcategory == %@", subcategory))
        }
        
        if !predicates.isEmpty {
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
        }
        
        do {
            return try store.context.fetch(request)
        } catch {
            print("Error fetching inventory items: \(error)")
            return []
        }
    }
    
    func addInventoryItem(name: String, quantity: Int64, imageName: String, info: String, category: String, subcategory: String) {
        let newItem = InventoryItem(context: store.context)
        newItem.id = UUID()
        newItem.name = name
        newItem.info = info
        newItem.quantity = quantity
        newItem.image = loadImageData(from: imageName)
        newItem.category = category
        newItem.subcategory = subcategory
        newItem.imageName = imageName
        saveContext()
    }
    
    func deleteInventoryItem(item: InventoryItem) {
        store.context.delete(item)
        saveContext()
    }
    
    func updateInventoryItem(item: InventoryItem, name: String, quantity: Int64, info: String, imageName: String) {
        item.name = name
        item.quantity = quantity
        item.info = info
        item.image = loadImageData(from: imageName)
        item.imageName = imageName
        saveContext()
    }
    
    private func loadImageData(from imageName: String) -> Data? {
        guard let uiImage = UIImage(named: imageName) else { return nil }
        return uiImage.pngData()
    }
    
    func fetchCategories() -> [CategoryEntity] {
        let request = CategoryEntity.fetchRequest()
        
        
        do {
            return try store.context.fetch(request)
           
        } catch {
            print("Error fetching categories: \(error)")
            return []
        }
    }
    
    func fetchSubCategories(from categoryName: String) -> [String] {
            let request = CategoryEntity.fetchRequest()
            request.predicate = NSPredicate(format: "name == %@", categoryName)
            
            do {
                let results = try store.context.fetch(request)
                return results.first?.subcategories as? [String] ?? []
            } catch {
                print("Error fetching subcategories: \(error)")
                return []
            }
        }
    
    func addCategory(name: String, imageName: String, subcategories: [String]) {
        let newCategory = CategoryEntity(context: store.context)
        newCategory.id = UUID()
        newCategory.name = name
        newCategory.imageName = imageName
        newCategory.subcategories = subcategories as NSObject
        
        saveContext()
    }
    
    func deleteCategory(category: CategoryEntity) {
            store.context.delete(category)
            saveContext()
        }
    
    func deleteSubcategory(categoryName: String, subcategoryName: String) {
            let request = CategoryEntity.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", categoryName)
          
            
            do {
                if let result = try store.context.fetch(request).first {
                    if var subcategories = result.subcategories as? [String], let index = subcategories.firstIndex(of: subcategoryName) {
                        subcategories.remove(at: index)
                        result.subcategories = subcategories as NSObject
                        saveContext()
                    }
                }
            } catch {
                print("Error deleting subcategory: \(error)")
            }
        }
    
    private func saveContext() {
        if store.context.hasChanges {
            do {
                try store.context.save()
            } catch {
                print("Error saving context: \(error)")
            }
        }
    }
}
