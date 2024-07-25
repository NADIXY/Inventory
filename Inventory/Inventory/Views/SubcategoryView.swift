//
//  SubcategoryView.swift
//  Inventory
//
//  Created by Lutz Brückner on 23.07.24.
//

import SwiftUI

struct SubcategoryView: View {
    let category: CategoryEntity
    @EnvironmentObject var viewModel: InventoryViewModel
   
    let columns = [
        GridItem(.fixed(150), spacing: 20),
        GridItem(.fixed(150), spacing: 20)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]),
                               startPoint: .top,
                               endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        if let subcategories = category.subcategories as? [String] {
                            ForEach(subcategories, id: \.self) { subcategory in
                                if let categoryName = category.name {
                                    NavigationLink(destination: InventoryListView(category: categoryName, subcategory: subcategory)) {
                                        SubcategoryItemView(itemCount: viewModel.itemCount(for: categoryName, subcategory: subcategory), subcategory: subcategory)
                                    }
                                    .contextMenu {
                                        Button(action: {
                                            viewModel.deleteSubcategory(categoryName: categoryName, subcategoryName: subcategory)
                                            viewModel.fetchCategories()
                                        }) {
                                            Text("Unterkategorie löschen")
                                            Image(systemName: "trash")
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    if let categoryName = category.name {
                        Text(categoryName)
                            .font(.custom("Georgia", size: 28))
                            .foregroundColor(.gray)
                    }
                }
            }
            .onAppear {
                if let categoryName = category.name {
                    viewModel.fetchInventoryItems(category: categoryName)
                }
            }
        }
    }
}
