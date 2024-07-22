//
//  PersistentStore.swift
//  Inventory
//
//  Created by Lutz Brückner on 22.07.24.
//

import Foundation
import CoreData

class PersistenceStore {
    var context: NSManagedObjectContext { container.viewContext }
    private let container: NSPersistentContainer
    
    static let shared = PersistenceStore()
    
    init() {
        container = NSPersistentContainer(name: "Inventory")
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores { _, error in
            if let error = error as? NSError {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}
