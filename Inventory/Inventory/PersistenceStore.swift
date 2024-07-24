//
//  PersistentStore.swift
//  Inventory
//
//  Created by Lutz Brückner on 22.07.24.
//

import Foundation
import CoreData

class PersistenceStore {
   static let shared = PersistenceStore()
    
    init() {}
       
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Inventory")
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return container.viewContext
    }
}
