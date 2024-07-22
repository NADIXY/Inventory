//
//  InventoryApp.swift
//  Inventory
//
//  Created by Lutz Brückner on 22.07.24.
//

import SwiftUI

@main
struct InventoryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
