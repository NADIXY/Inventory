//
//  SubcategoryView.swift
//  Inventory
//
//  Created by Lutz Brückner on 23.07.24.
//

import SwiftUI

struct SubcategoryView: View {
    let category: Category
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
                        ForEach(category.subcategories, id: \.self) { subcategory in
                            NavigationLink(destination: InventoryListView(category: category.name, subcategory: subcategory)) {
                                SubcategoryItemView(itemCount: viewModel.itemCount(for: category.name, subcategory: subcategory), subcategory: subcategory)
                            }
                        }
                    }
                    .padding()
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(category.name)
                        .font(.custom("Georgia", size: 28))
                        .foregroundColor(.gray)
                }
            }
            .onAppear {
                viewModel.fetchInventoryItems(category: category.name)
            }
        }
    }
}
