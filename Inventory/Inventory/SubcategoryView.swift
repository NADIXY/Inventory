//
//  SubcategoryView.swift
//  Inventory
//
//  Created by Lutz Brückner on 23.07.24.
//

import SwiftUI

struct SubcategoryView: View {
    let category: Category
    @StateObject private var viewModel = InventoryViewModel()
    let columns = [
        GridItem(.fixed(150), spacing: 20),
        GridItem(.fixed(150), spacing: 20)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.teal]),
                               startPoint: .top,
                               endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(category.subcategories, id: \.self) { subcategory in
                            NavigationLink(destination: InventoryListView(category: category.name, subcategory: subcategory)) {
                                SubcategoryItemView(subcategory: subcategory, itemCount: viewModel.itemCount(for: category.name, subcategory: subcategory)
                                )
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle(category.name)
            }
        }
    }
}
