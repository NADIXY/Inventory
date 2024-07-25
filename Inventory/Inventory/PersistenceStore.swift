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
    let context: NSManagedObjectContext

    private init() {
        let container = NSPersistentContainer(name: "Inventory")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        context = container.viewContext
    }
}
