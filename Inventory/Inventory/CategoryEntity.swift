//
//  CategoryEntity.swift
//  Inventory
//
//  Created by Lutz Brückner on 24.07.24.
//

import CoreData

extension CategoryEntity {
    func toCategory() -> Category {
        return Category(
            id: self.id ?? UUID(),
            name: self.name ?? "",
            imageName: self.imageName ?? "",
            subcategories: (self.subcategories as? [String]) ?? []
        )
    }
}
