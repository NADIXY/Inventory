//
//  InventoryItemEntity.swift
//  Inventory
//
//  Created by Lutz Brückner on 24.07.24.
//

import CoreData

extension InventoryItemEntity {
    func toInventoryItem() -> InventoryItem {
        return InventoryItem(
            id: self.id ?? UUID(),
            name: self.name ?? "",
            quantity: self.quantity,
            image: self.image,
            category: self.category ?? "",
            subcategory: self.subcategory ?? ""
        )
    }
}

