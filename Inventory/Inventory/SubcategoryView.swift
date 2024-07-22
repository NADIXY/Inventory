//
//  SubcategoryView.swift
//  Inventory
//
//  Created by Lutz Brückner on 23.07.24.
//

import SwiftUI

struct SubcategoryView: View {
    let category: Category
    
    var body: some View {
        List(category.subcategories, id: \.self) { subcategory in
            Text(subcategory)
        }
        .navigationTitle(category.name)
    }
}
