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
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "CategoryEntity")
        request.resultType = .managedObjectResultType
        do {
            let count = try store.context.count(for: request)
            if count == 0 {
                for category in categories {
                    let newCategory = NSEntityDescription.insertNewObject(forEntityName: "CategoryEntity", into: store.context)
                    newCategory.setValue(UUID(), forKey: "id")
                    newCategory.setValue(category.name, forKey: "name")
                    newCategory.setValue(category.imageName, forKey: "imageName")
                    newCategory.setValue(category.subcategories, forKey: "subcategories")
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
    
    func addInventoryItem(name: String, quantity: Int64, imageName: String, category: String, subcategory: String) {
        let newItem = InventoryItem(context: store.context)
        newItem.id = UUID()
        newItem.name = name
        newItem.quantity = quantity
        newItem.image = loadImageData(from: imageName)
        newItem.category = category
        newItem.subcategory = subcategory
        saveContext()
    }
    
    func deleteInventoryItem(item: InventoryItem) {
        store.context.delete(item)
        saveContext()
    }
    
    func updateInventoryItem(item: InventoryItem, name: String, quantity: Int64, imageName: String) {
        item.name = name
        item.quantity = quantity
        item.image = loadImageData(from: imageName)
        saveContext()
    }
    
    private func loadImageData(from imageName: String) -> Data? {
        guard let uiImage = UIImage(named: imageName) else { return nil }
        return uiImage.pngData()
    }
    
    func fetchCategories() -> [Category] {
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "CategoryEntity")
        request.resultType = .managedObjectResultType
        
        do {
            let results = try store.context.fetch(request)
            return results.compactMap { result in
                guard let category = result as? NSManagedObject else { return nil }
                return Category(
                    name: category.value(forKey: "name") as! String,
                    imageName: category.value(forKey: "imageName") as! String,
                    subcategories: (category.value(forKey: "subcategories") as? [String]) ?? []
                )
            }
        } catch {
            print("Error fetching categories: \(error)")
            return []
        }
    }
    
    func addCategory(name: String, imageName: String, subcategories: [String]) {
        let newCategory = NSEntityDescription.insertNewObject(forEntityName: "CategoryEntity", into: store.context)
        newCategory.setValue(UUID(), forKey: "id")
        newCategory.setValue(name, forKey: "name")
        newCategory.setValue(imageName, forKey: "imageName")
        newCategory.setValue(subcategories, forKey: "subcategories")
        
        saveContext()
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
