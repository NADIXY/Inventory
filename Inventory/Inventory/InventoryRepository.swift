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
